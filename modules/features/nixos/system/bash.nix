_: {
  flake.nixosModules.bash = _: {
    programs.bash = {
      enable = true;
      completion.enable = true;
    };
  };
}
