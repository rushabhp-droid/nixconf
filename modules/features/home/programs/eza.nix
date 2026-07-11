_: {
  flake.homeModules.eza = _: {
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
