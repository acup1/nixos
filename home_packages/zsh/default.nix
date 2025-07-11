{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    starship
  ];

  home.file = {
    ".zshrc".source = ./.zshrc;
  };
}
