_: {
  flake.homeModules.waybar = _: {
    stylix.targets.waybar.enable = false;
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };
  };
}
