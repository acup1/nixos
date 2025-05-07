{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (
      (octaveFull.override {
        graphicsmagick = graphicsmagick.override {
          quantumdepth = 32;
        };
      }).withPackages
      (ps:
        with ps; [
          signal
          symbolic
        ])
    )
    ghostscript
  ];
}
