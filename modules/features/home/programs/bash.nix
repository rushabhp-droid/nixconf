_: {
  flake.homeModules.bash = _: {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
