_: {
  flake.homeModules.hyprland = _: {

    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
    };

  };
}
