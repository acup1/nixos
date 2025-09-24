{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (octaveFull.withPackages (
      p:
        with p; [
          signal
          symbolic
        ]
    ))
    gnuradio
  ];
}
