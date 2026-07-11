{ inputs, ... }: {
  flake.homeModules.quickshell = { pkgs, ... }: {
    home.packages = with pkgs; [
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    programs.quickshell = {
      enable = true;
      systemd.enable = true;

      configs = {
        activeConfig = "./bar";
      };
    };
  };
}
