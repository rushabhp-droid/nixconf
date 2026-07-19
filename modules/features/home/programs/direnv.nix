{ inputs, ... }: {
  flake.homeModules.direnv = _: {

    imports = [ inputs.direnv-instant.homeModules.direnv-instant ];

    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableBashIntegration = true;
      };

      direnv-instant = {
        enable = true;
        enableBashIntegration = true;
      };

    };
  };
}
