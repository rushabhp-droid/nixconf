_: {

  flake.homeModules.hyprland =
    { pkgs, lib, ... }:
    let
      lua = lib.generators.mkLuaInline;

      mainMod = "SUPER";
      terminal = "${pkgs.kitty}/bin/kitty";
      fileManager = "${pkgs.thunar}/bin/thunar";
      menu = ''${pkgs.rofi}/bin/rofi -show drun -run-command \"uwsm app -- {cmd}\"'';

      # Helper to build a bind entry
      mkBind = keys: dispatcher: {
        _args = [
          keys
          dispatcher
        ];
      };

      # Helper to build a bind entry with flags
      mkBindF = keys: dispatcher: flags: {
        _args = [
          keys
          dispatcher
          flags
        ];
      };

      # Generate workspace binds for 1–10 (key 10 maps to 0)
      workspaceBinds = builtins.concatLists (
        builtins.genList (
          n:
          let
            i = n + 1;
            key = toString (lib.mod i 10);
          in
          [
            (mkBind "${mainMod} + ${key}" (lua "hl.dsp.focus({ workspace = ${toString i} })"))
            (mkBind "${mainMod} + SHIFT + ${key}" (lua "hl.dsp.window.move({ workspace = ${toString i} })"))
          ]
        ) 10
      );
    in
    {
      wayland.windowManager.hyprland.settings.bind = [
        # ── App Launchers ──────────────────────────────────────────────
        (mkBind "${mainMod} + Q" (lua ''hl.dsp.exec_cmd("${terminal}")''))
        (mkBind "${mainMod} + E" (lua ''hl.dsp.exec_cmd("${fileManager}")''))
        (mkBind "${mainMod} + R" (lua ''hl.dsp.exec_cmd("${menu}")''))
        (mkBind "${mainMod} + L" (lua ''hl.dsp.exec_cmd("${pkgs.wleave}/bin/wleave")''))

        # ── Screenshot ─────────────────────────────────────────────────
        (mkBind "Print" (
          lua ''hl.dsp.exec_cmd("${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -")''
        ))
        (mkBind "${mainMod} + Print" (
          lua ''hl.dsp.exec_cmd("${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy")''
        ))

        # ── Window Management ──────────────────────────────────────────
        (mkBind "${mainMod} + C" (lua "hl.dsp.window.close()"))
        (mkBind "${mainMod} + M" (
          lua ''hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")''
        ))

        # ── Clipboard ─────────────────────────────────────────────────
        (mkBind "${mainMod} + SHIFT + V" (
          lua ''hl.dsp.exec_cmd("${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu -display-columns 2 | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy")''
        ))

        # ── Window Toggles ─────────────────────────────────────────────
        (mkBind "${mainMod} + V" (lua ''hl.dsp.window.float({ action = "toggle" })''))
        (mkBind "${mainMod} + F" (lua ''hl.dsp.window.fullscreen({ action = "toggle" })''))
        (mkBind "${mainMod} + P" (lua "hl.dsp.window.pseudo()"))
        (mkBind "${mainMod} + J" (lua ''hl.dsp.layout("togglesplit")''))

        # ── Focus (arrow keys) ─────────────────────────────────────────
        (mkBind "${mainMod} + left" (lua ''hl.dsp.focus({ direction = "left" })''))
        (mkBind "${mainMod} + right" (lua ''hl.dsp.focus({ direction = "right" })''))
        (mkBind "${mainMod} + up" (lua ''hl.dsp.focus({ direction = "up" })''))
        (mkBind "${mainMod} + down" (lua ''hl.dsp.focus({ direction = "down" })''))
      ]

      # ── Workspaces 1–10 ───────────────────────────────────────────
      ++ workspaceBinds

      ++ [
        # ── Special Workspace (scratchpad) ─────────────────────────────
        (mkBind "${mainMod} + S" (lua ''hl.dsp.workspace.toggle_special("magic")''))
        (mkBind "${mainMod} + SHIFT + S" (lua ''hl.dsp.window.move({ workspace = "special:magic" })''))

        # ── Scroll through workspaces ──────────────────────────────────
        (mkBind "${mainMod} + mouse_down" (lua ''hl.dsp.focus({ workspace = "e+1" })''))
        (mkBind "${mainMod} + mouse_up" (lua ''hl.dsp.focus({ workspace = "e-1" })''))

        # ── Mouse move/resize ──────────────────────────────────────────
        (mkBindF "${mainMod} + mouse:272" (lua "hl.dsp.window.drag()") { mouse = true; })
        (mkBindF "${mainMod} + mouse:273" (lua "hl.dsp.window.resize()") { mouse = true; })

        # ── Multimedia Keys ────────────────────────────────────────────
        (mkBindF "XF86AudioRaiseVolume" (lua ''hl.dsp.exec_cmd("swayosd-client --output-volume raise")'') {
          locked = true;
          repeating = true;
        })
        (mkBindF "XF86AudioLowerVolume" (lua ''hl.dsp.exec_cmd("swayosd-client --output-volume lower")'') {
          locked = true;
          repeating = true;
        })
        (mkBindF "XF86AudioMute" (lua ''hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle")'') {
          locked = true;
          repeating = true;
        })
        (mkBindF "XF86AudioMicMute" (lua ''hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle")'') {
          locked = true;
          repeating = true;
        })
        (mkBindF "XF86MonBrightnessUp"
          (lua ''hl.dsp.exec_cmd("swayosd-client --brightness raise --device intel_backlight")'')
          {
            locked = true;
            repeating = true;
          }
        )
        (mkBindF "XF86MonBrightnessDown"
          (lua ''hl.dsp.exec_cmd("swayosd-client --brightness lower --device intel_backlight")'')
          {
            locked = true;
            repeating = true;
          }
        )

        # ── QoL ────────────────────────────────────────────────────────
        (mkBindF "Caps_Lock" (lua ''hl.dsp.exec_cmd("swayosd-client --caps-lock")'') { release = true; })

        # ── Playerctl Media Keys ───────────────────────────────────────
        (mkBindF "XF86AudioNext" (lua ''hl.dsp.exec_cmd("swayosd-client --playerctl next")'') {
          locked = true;
        })
        (mkBindF "XF86AudioPause" (lua ''hl.dsp.exec_cmd("swayosd-client --playerctl play-pause")'') {
          locked = true;
        })
        (mkBindF "XF86AudioPlay" (lua ''hl.dsp.exec_cmd("swayosd-client --playerctl play-pause")'') {
          locked = true;
        })
        (mkBindF "XF86AudioPrev" (lua ''hl.dsp.exec_cmd("swayosd-client --playerctl previous")'') {
          locked = true;
        })
      ];
    };
}
