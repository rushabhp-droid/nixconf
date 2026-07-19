{ host, ... }: {
  flake.homeModules.bash = { host, ... }: {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
