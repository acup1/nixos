{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    octaveFull.withPackages
    (ps:
      with ps; [
        control
        signal
        symbolic
      ])
  ];
}
