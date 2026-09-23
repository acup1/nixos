{config, ...}: {
  xdg.configFile."DankMaterialShell/themes/amoledBlack/theme.json".source =
    ./themes/amoledBlack/theme.json;

  programs.dank-material-shell.settings = {
    currentThemeName = "custom";
    currentThemeCategory = "registry";
    customThemeFile = "${config.xdg.configHome}/DankMaterialShell/themes/amoledBlack/theme.json";
    registryThemeVariants = {
      amoledBlack = {
        dark = {
          flavor = "black";
          accent = "white";
        };
      };
    };
    popupTransparency = 0.4;
    dockTransparency = 0.4;
    m3ElevationEnabled = false;
    barElevationEnabled = false;
    blurEnabled = true;
    blurLayerOutlineOpacity = 0;
    blurBorderEnabled = false;
    launcherStyle = "island";
    screenPreferences = {
      wallpaper = ["all"];
    };
    barConfigs = [
      {
        autoHide = false;
        autoHideDelay = 250;
        borderColor = "surfaceText";
        borderEnabled = false;
        borderOpacity = 1;
        borderThickness = 1;
        bottomGap = 0;
        centerWidgets = ["music" "clock"];
        clickThrough = false;
        enabled = true;
        fontScale = 1.11;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        gothCornersEnabled = false;
        iconScale = 1;
        id = "default";
        innerPadding = 1;
        leftWidgets = ["launcherButton"];
        maximizeDetection = true;
        maximizeWidgetIcons = false;
        maximizeWidgetText = false;
        name = "Main Bar";
        noBackground = false;
        openOnOverview = false;
        popupGapsAuto = true;
        popupGapsManual = 4;
        position = 0;
        removeWidgetPadding = false;
        rightWidgets = [
          "systemTray"
          "clipboard"
          "notificationButton"
          "battery"
          "controlCenterButton"
          {
            id = "powerMenuButton";
            enabled = true;
          }
        ];
        screenPreferences = ["all"];
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
        shadowColorMode = "text";
        shadowCustomColor = "#000000";
        shadowIntensity = 0;
        shadowOpacity = 60;
        showOnLastDisplay = true;
        showOnWindowsOpen = false;
        spacing = 4;
        squareCorners = false;
        transparency = 0.26;
        visible = true;
        widgetOutlineColor = "primary";
        widgetOutlineEnabled = false;
        widgetOutlineOpacity = 1;
        widgetOutlineThickness = 1;
        widgetPadding = 9;
        widgetTransparency = 1;
        attachToScreenEdge = false;
        batteryColorMode = "level";
        barInsetPadding = 4;
        barLengthPadding = 143;
        island = false;
      }
    ];
    desktopClockCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    systemMonitorCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    builtInPluginSettings = {
      dms_settings_search = {
        trigger = "?";
      };
      dms_clipboard_search = {
        trigger = "cb";
      };
      dms_power = {
        trigger = "pw";
      };
      dms_qr_generator = {
        trigger = "qrg";
      };
    };
    configVersion = 18;
  };
}
