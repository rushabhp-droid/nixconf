{ self, inputs, ... }: {
  flake.homeModules.bat = _: {
    programs.bat = {
      enable = true;
    };
  };
}
