{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.file = {
    ".zshrc".source = ./.zshrc;
  };
}
