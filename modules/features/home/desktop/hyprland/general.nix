_: {

  flake.homeModules.hyprland = { lib, ... }: {
    wayland.windowManager.hyprland.settings = {

      # ── Gestures ─────────────────────────────────────────────────────
      gesture = [
        {
          _args = [
            {
              fingers = 3;
              direction = "swipe";
              action = "move";
            }
          ];
        }
        {
          _args = [
            {
              fingers = 3;
              direction = "pinch";
              action = "fullscreen";
            }
          ];
        }
        {
          _args = [
            {
              fingers = 4;
              direction = "horizontal";
              action = "workspace";
            }
          ];
        }
      ];

      # ── General / Decoration / Dwindle ───────────────────────────────
      config = {
        general = {
          gaps_in = 4;
          gaps_out = 5;
          border_size = 2;
          resize_on_border = false;
          snap = {
            enabled = true;
            window_gap = 4;
            monitor_gap = 5;
            respect_gaps = true;
          };
        };

        decoration = {
          rounding = 10;
          rounding_power = 2.5;
          blur = {
            enabled = true;
            xray = true;
            special = false;
            new_optimizations = true;
            size = 10;
            passes = 3;
            brightness = 1;
            noise = 0.05;
            contrast = 0.89;
            vibrancy = 0.5;
            vibrancy_darkness = 0.5;
            popups = false;
            popups_ignorealpha = 0.6;
            input_methods = true;
            input_methods_ignorealpha = 0.8;
          };

          shadow = {
            enabled = true;
            range = 20;
            offset = [
              0
              2
            ];
            render_power = 10;
          };

          # Dim
          dim_inactive = true;
          dim_strength = 0.05;
          dim_special = 0.2;
        };

        dwindle = {
          preserve_split = true;
          smart_split = false;
          smart_resizing = false;
        };
      };
    };
  };
}
