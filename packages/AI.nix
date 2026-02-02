{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      #lmstudio
      # ollama
    ];
  # services.ollama.enable = true;
  # services.ollama.serve = true;
}
