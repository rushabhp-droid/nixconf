_: {

  flake.homeModules.hyprland = _: {
    wayland.windowManager.hyprland.settings = {

      # ── Window Rules ───────────────────────────────────────────────────
      window_rule = [
        # Ignore maximize requests from all apps
        {
          _args = [
            {
              name = "suppress-maximize-events";
              match = {
                class = ".*";
              };
              suppress_event = "maximize";
            }
          ];
        }

        # Fix some dragging issues with XWayland
        {
          _args = [
            {
              name = "fix-xwayland-drags";
              match = {
                class = "^$";
                title = "^$";
                xwayland = true;
                float = true;
                fullscreen = false;
                pin = false;
              };
              no_focus = true;
            }
          ];
        }

        # File Operation Progress
        {
          _args = [
            {
              match = {
                title = "File Operation Progress";
              };
              float = true;
            }
          ];
        }

        # Hyprland Run
        {
          _args = [
            {
              name = "move-hyprland-run";
              match = {
                class = "hyprland-run";
              };
              move = "20 monitor_h-120";
              float = true;
            }
          ];
        }

        # Thunar rename dialog
        {
          _args = [
            {
              match = {
                class = "^(Thunar)$";
                title = "^(Rename .*)";
              };
              float = true;
            }
          ];
        }

        # Blueman Manager
        {
          _args = [
            {
              name = "blueman-manager";
              match = {
                class = "blueman-manager";
              };
              float = true;
              center = true;
              size = "800 600";
            }
          ];
        }

        # GTK File and Folder Picker
        {
          _args = [
            {
              name = "xdg-desktop-portal-gtk";
              match = {
                class = "xdg-desktop-portal-gtk";
              };
              float = true;
              center = false;
              size = "800 600";
            }
          ];
        }

        # Picture-in-Picture
        {
          _args = [
            {
              name = "Picture-in-Picture";
              match = {
                title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$";
              };
              float = true;
              pin = true;
              focus_on_activate = false;
              no_initial_focus = true;
              suppress_event = "activate";
            }
          ];
        }

        # Screen sharing
        {
          _args = [
            {
              match = {
                title = ".*is sharing (a window|your screen).*";
              };
              float = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                title = ".*is sharing (a window|your screen).*";
              };
              pin = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                title = ".*is sharing (a window|your screen).*";
              };
              move = [
                "(monitor_w*.5-window_w*.5)"
                "(monitor_h-window_h-12)"
              ];
            }
          ];
        }

        # ── Tearing ───────────────────────────────────────────────────────
        {
          _args = [
            {
              match = {
                title = ".*\\.exe";
              };
              immediate = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                title = ".*minecraft.*";
              };
              immediate = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                class = "^(steam_app).*";
              };
              immediate = true;
            }
          ];
        }

        # No shadow for tiled windows
        {
          _args = [
            {
              match = {
                float = 0;
              };
              no_shadow = true;
            }
          ];
        }
      ];

      # ── Workspace Rules ────────────────────────────────────────────────
      workspace_rule = [
        {
          _args = [
            {
              workspace = "special:special";
              gaps_out = 30;
            }
          ];
        }
      ];

      # ── Layer Rules ────────────────────────────────────────────────────
      layer_rule = [
        {
          _args = [
            {
              match = {
                namespace = ".*";
              };
              xray = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "selection";
              };
              no_anim = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "overview";
              };
              no_anim = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "noanim";
              };
              no_anim = true;
            }
          ];
        }
        # wleave
        {
          _args = [
            {
              match = {
                namespace = "logout_dialog";
              };
              blur = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "launcher";
              };
              blur = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "launcher";
              };
              ignore_alpha = 0.5;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "notifications";
              };
              blur = true;
            }
          ];
        }
        {
          _args = [
            {
              match = {
                namespace = "notifications";
              };
              ignore_alpha = 0.69;
            }
          ];
        }
      ];
    };
  };
}
