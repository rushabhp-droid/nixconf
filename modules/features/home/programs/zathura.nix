{ self, inputs, ... }: {
  flake.homeModules.zathura = _: {
    programs.zathura = {
      enable = true;
    };
  };
}
