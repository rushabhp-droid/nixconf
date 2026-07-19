{ self, inputs, ... }: {
  flake.homeModules.lf = _: {
    programs.lf = {
      enable = true;
    };
  };
}
