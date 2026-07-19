{ host, ... }: {
  flake.homeModules.bash = _: {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        source <(nh alias use ${host.flakeDir})
      '';
    };
  };
}
