{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (
      octaveFull.withPackages
      (ps:
        with ps; [
          signal
          symbolic
        ])
    )
  ];
}
