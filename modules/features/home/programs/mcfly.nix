_: {
  flake.homeModules.mcfly = _: {
    programs.mcfly = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
