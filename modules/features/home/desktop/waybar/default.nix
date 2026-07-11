_: {
  flake.homeModules.waybar = _: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };
  };
}
