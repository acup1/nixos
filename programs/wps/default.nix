{ lib, stdenv, dpkg, autoPatchelfHook, alsa-lib, at-spi2-core, libtool
, libxkbcommon, nspr, mesa, libtiff, udev, gtk3, libsForQt5, xorg, cups, pango
, libjpeg, gtk2, gdk-pixbuf, libpulseaudio, libbsd, libusb1, libmysqlclient
, llvmPackages, dbus, gcc-unwrapped, freetype, curl, makeWrapper
, runCommandLocal, cacert, coreutils, bzip2, }:
let
  pkgVersion = "12.1.2.22571";
  url =
    "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/22571/wps-office_${pkgVersion}.AK.preread.sw_480057_amd64.deb";
  hash = "sha256-oppJqiUEe/0xEWxgKVMPMFngjQ0e5xaac6HuFVIBh8I=";
  uri =
    builtins.replaceStrings [ "https://wps-linux-personal.wpscdn.cn" ] [ "" ]
    url;
  securityKey = "7f8faaaa468174dc1c9cd62e5f218a5b";
in stdenv.mkDerivation rec {
  pname = "wps";
  version = pkgVersion;

  src = runCommandLocal "wps-office_${version}.AK.preread.sw_480057_amd64.deb" {
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = hash;

    nativeBuildInputs = [ curl coreutils ];

    impureEnvVars = lib.fetchers.proxyImpureEnvVars;
    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  } ''
    timestamp10=$(date '+%s')
    md5hash=($(echo -n "${securityKey}${uri}$timestamp10" | md5sum))
    curl \
    --retry 3 --retry-delay 3 \
    "${url}?t=$timestamp10&k=$md5hash" \
    > $out
  '';

  unpackCmd = "dpkg -x $src .";
  sourceRoot = ".";

  nativeBuildInputs = [ dpkg autoPatchelfHook makeWrapper ];

  buildInputs = [
    alsa-lib
    at-spi2-core
    libtool
    libjpeg
    libxkbcommon
    nspr
    mesa
    libtiff
    udev
    gtk3
    libsForQt5.qt5.qtbase
    xorg.libXdamage
    xorg.libXtst
    xorg.libXv
    gtk2
    gdk-pixbuf
    libpulseaudio
    xorg.libXScrnSaver
    xorg.libXxf86vm
    libbsd
    libusb1
    libmysqlclient
    llvmPackages.openmp
    dbus
    libsForQt5.fcitx5-qt
    (lib.getLib bzip2) # Use bzip2.lib output for libbz2.so
  ];

  dontWrapQtApps = true;

  runtimeDependencies = map lib.getLib [
    cups
    pango
    freetype
    gcc-unwrapped.lib
    bzip2 # Add bzip2 to runtimeDependencies
  ];

  autoPatchelfIgnoreMissingDeps = [
    "libkappessframework.so"
    "libQtCore.so.4"
    "libQtNetwork.so.4"
    "libQtXml.so.4"
    "libnautilus-extension.so.1"
    "libcaja-extension.so.1"
    "libpeony.so.3"
    "libuof.so"
    "libmysqlclient.so.18"
  ];

  installPhase = ''
    runHook preInstall
    prefix=$out/opt/kingsoft/wps-office
    mkdir -p $out
    cp -r opt $out
    cp -r usr/* $out
    # Remove broken bzip2 symlinks from the deb package
    rm -f $out/opt/kingsoft/wps-office/office6/libbz2.so
    rm -f $out/opt/kingsoft/wps-office/office6/libbz2.so.1.0.4
    # Create correct symlink to bzip2 library
    ln -sf ${
      lib.getLib bzip2
    }/lib/libbz2.so.1 $out/opt/kingsoft/wps-office/office6/libbz2.so
    ln -sf ${
      lib.getLib bzip2
    }/lib/libbz2.so.1 $out/opt/kingsoft/wps-office/office6/libbz2.so.1.0.4
    for i in wps wpp et wpspdf; do
      substituteInPlace $out/bin/$i \
        --replace-fail /opt/kingsoft/wps-office $prefix
    done
    for i in $out/share/applications/*.desktop; do
      substituteInPlace $i \
        --replace-fail /usr/bin $out/bin
    done
    # Need system freetype, gcc lib, and bzip2 to run properly
    for i in wps wpp et wpspdf wpsoffice; do
      wrapProgram $out/opt/kingsoft/wps-office/office6/$i \
        --set LD_PRELOAD "${freetype}/lib/libfreetype.so" \
        --set LD_LIBRARY_PATH "${
          lib.makeLibraryPath [ gcc-unwrapped.lib (lib.getLib bzip2) ]
        }"
    done
    runHook postInstall
  '';

  preFixup = ''
    # The following libraries need libtiff.so.5, but nixpkgs provides libtiff.so.6
    patchelf --replace-needed libtiff.so.5 libtiff.so $out/opt/kingsoft/wps-office/office6/{libpdfmain.so,libqpdfpaint.so,qt/plugins/imageformats/libqtiff.so,addons/pdfbatchcompression/libpdfbatchcompressionapp.so}
    patchelf --replace-needed libtiff.so.5 libtiff.so $out/opt/kingsoft/wps-office/office6/addons/ksplitmerge/libksplitmergeapp.so
    patchelf --add-needed libtiff.so $out/opt/kingsoft/wps-office/office6/libwpsmain.so
    # Fix: Wrong JPEG library version: library is 62, caller expects 80
    patchelf --add-needed libjpeg.so $out/opt/kingsoft/wps-office/office6/libwpsmain.so
    # dlopen dependency
    patchelf --add-needed libudev.so.1 $out/opt/kingsoft/wps-office/office6/addons/cef/libcef.so
  '';

  meta = with lib; {
    description = "Office suite, formerly Kingsoft Office";
    homepage = "https://www.wps.com";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    hydraPlatforms = [ ];
    license = licenses.unfreeRedistributable;
    maintainers = with maintainers; [ mlatus th0rgal rewine pokon548 ];
  };
}
