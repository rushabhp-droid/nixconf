_: {

  flake.homeModules.hyprland = _: {
    wayland.windowManager.hyprland.settings = {

      # ── Misc / Cursor / XWayland ─────────────────────────────────────
      config = {
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          vrr = 1;
          enable_swallow = true;
          swallow_regex = "^(kitty|Alacritty)$";
          disable_splash_rendering = true;
          focus_on_activate = true;
        };
        cursor = {
          zoom_factor = 1;
          zoom_rigid = false;
          zoom_disable_aa = true;
          hotspot_padding = 1;
        };
        xwayland = {
          force_zero_scaling = true;
        };
        master = {
          new_status = "master";
        };
        scrolling = {
          fullscreen_on_one_column = true;
        };
      };
    };
  };
}
