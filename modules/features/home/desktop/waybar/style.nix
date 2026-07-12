_: {
  flake.homeModules.waybar = _: {
    programs.waybar.style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        font-weight: 500;
        min-height: 0;
      }

      window#waybar {
        background: alpha(@base00, 0.85);
        color: @base05;
        border-radius: 12px;
      }

      tooltip {
        background: @base00;
        border-radius: 12px;
        border: 2px solid @base0D;
      }
      tooltip label {
        color: @base05;
      }

      #workspaces {
        margin: 4px 8px;
        background: alpha(@base01, 0.8);
        border-radius: 16px;
      }

      #workspaces button {
        padding: 0 10px;
        background: transparent;
        color: @base04;
        border-radius: 16px;
        transition: all 0.3s ease;
      }

      #workspaces button:hover {
        background: alpha(@base0D, 0.3);
      }

      #workspaces button.active {
        background: @base0D;
        color: @base00;
        font-weight: bold;
      }

      #workspaces button.urgent {
        background: @base08;
        color: @base00;
      }

      #window {
        margin: 4px 8px;
        color: @base05;
      }

      #clock,
      #battery,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 12px;
        margin: 4px 4px;
        color: @base05;
        background-color: alpha(@base01, 0.8);
        border-radius: 16px;
        transition: all 0.3s ease;
      }

      #clock:hover,
      #battery:hover,
      #network:hover,
      #pulseaudio:hover,
      #tray:hover {
        background-color: alpha(@base02, 0.9);
      }

      #clock {
        color: @base0E;
        background-color: alpha(@base01, 0.8);
      }

      #battery {
        color: @base0B;
      }
      #battery.charging, #battery.plugged {
        color: @base0C;
      }
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
      #battery.critical:not(.charging) {
        background-color: @base08;
        color: @base00;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #network {
        color: @base0D;
      }

      #network.disconnected {
        background-color: @base08;
        color: @base00;
      }

      #pulseaudio {
        color: @base0A;
      }

      #pulseaudio.muted {
        color: @base03;
      }

      #tray {
        margin-right: 8px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: @base08;
      }
    '';
  };
}
