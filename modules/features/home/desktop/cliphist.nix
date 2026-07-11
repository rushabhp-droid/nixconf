_: {
  flake.homeModules.cliphist = _: {
    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
