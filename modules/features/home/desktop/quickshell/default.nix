{ inputs, ... }: {
  flake.homeModules.quickshell = { pkgs, ... }: {

    programs.quickshell = {
      enable = true;
      package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
      # systemd.enable = true;

      # configs = {
      #  activeConfig = "./bar";
      # };
    };
  };
}
