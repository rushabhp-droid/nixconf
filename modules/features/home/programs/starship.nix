_: {
  flake.homeModules.starship = _: {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
