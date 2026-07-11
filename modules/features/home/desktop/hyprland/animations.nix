_: {

  flake.homeModules.hyprland = _: {
    wayland.windowManager.hyprland.settings = {

      # ── Animations ───────────────────────────────────────────────────
      config = {
        animations = {
          enabled = true;
        };
      };

      # ── Animation Curves (Bezier) ────────────────────────────────────
      curve = [
        {
          _args = [
            "wind"
            {
              type = "bezier";
              points = [
                [
                  0.05
                  0.9
                ]
                [
                  0.1
                  1.05
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "winIn"
            {
              type = "bezier";
              points = [
                [
                  0.1
                  1.1
                ]
                [
                  0.1
                  1.1
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "winOut"
            {
              type = "bezier";
              points = [
                [
                  0.3
                  (-0.3)
                ]
                [
                  0.0
                  1.0
                ]
              ];
            }
          ];
        }
        {
          _args = [
            "liner"
            {
              type = "bezier";
              points = [
                [
                  1.0
                  1.0
                ]
                [
                  1.0
                  1.0
                ]
              ];
            }
          ];
        }
      ];

      # ── Animation Rules ──────────────────────────────────────────────
      animation = [
        {
          _args = [
            {
              leaf = "windows";
              enabled = true;
              speed = 6;
              bezier = "wind";
              style = "slide";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windowsIn";
              enabled = true;
              speed = 6;
              bezier = "winIn";
              style = "slide";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windowsOut";
              enabled = true;
              speed = 5;
              bezier = "winOut";
              style = "slide";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "windowsMove";
              enabled = true;
              speed = 5;
              bezier = "wind";
              style = "slide";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "border";
              enabled = true;
              speed = 1;
              bezier = "liner";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "borderangle";
              enabled = true;
              speed = 30;
              bezier = "liner";
              style = "loop";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "fade";
              enabled = true;
              speed = 10;
              bezier = "default";
            }
          ];
        }
        {
          _args = [
            {
              leaf = "workspaces";
              enabled = true;
              speed = 5;
              bezier = "wind";
            }
          ];
        }
      ];
    };
  };
}
