_: {

  flake.homeModules.hyprland = _: {
    wayland.windowManager.hyprland.settings = {

      # ── Monitors ───────────────────────────────────────────────────────
      monitor = [
        # Laptop Monitor
        {
          _args = [
            {
              output = "eDP-1";
              mode = "1920x1080@144";
              position = "0x0";
              scale = 1.0;
            }
          ];
        }
        # DELL Monitor
        {
          _args = [
            {
              output = "HDMI-A-1";
              mode = "1920x1080@75";
              position = "1920x0";
              scale = 1.0;
            }
          ];
        }
      ];
    };
  };
}
