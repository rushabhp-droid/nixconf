_: {
  flake.homeModules.waybar =
    { config, ... }:
    let
      # Alias for easier access to Stylix colors
      colors = config.lib.stylix.colors.withHashtag;
    in
    {
      programs.waybar.style = ''
        * {
              border: none;
              border-radius: 0;
              /* Dynamically use Stylix fonts */
              font-family: "${config.stylix.fonts.monospace.name}"; 
              font-size: ${toString config.stylix.fonts.sizes.desktop}px;
              min-height: 0;
            }

            window#waybar {
              background-color: ${colors.base00}; 
              color: ${colors.base05};
            }

            /* Hyprland Workspace Styling */
            #workspaces button {
              padding: 0 6px;
              background: transparent;
              color: ${colors.base05};
              border-bottom: 2px solid transparent;
            }

            #workspaces button.active {
              color: ${colors.base0C}; /* Cyan/Teal accent */
              border-bottom: 2px solid ${colors.base0C}; 
            }

            #workspaces button:hover {
              background: transparent;
              box-shadow: inherit;
              text-shadow: inherit;
            }

            /* Separator Styling */
            #custom-separator {
              color: ${colors.base03}; /* Muted grey/comment color */
              padding: 0 8px;
            }

            /* Right Module Base Styling */
            #network, #cpu, #memory, #disk, #clock, #battery, #tray {
              padding: 0 4px;
              margin: 0 2px;
              border-bottom: 2px solid transparent;
            }

            /* Dynamic Stylix Base16 Module Colors */
            #network {
              color: ${colors.base0D}; /* Blue */
              border-bottom-color: ${colors.base0D};
            }

            #cpu {
              color: ${colors.base0B}; /* Green */
              border-bottom-color: ${colors.base0B};
            }

            #memory {
              color: ${colors.base0E}; /* Purple */
              border-bottom-color: ${colors.base0E};
            }

            #disk {
              color: ${colors.base0A}; /* Yellow */
              border-bottom-color: ${colors.base0A};
            }

            #clock {
              color: ${colors.base0C}; /* Cyan/Teal */
              border-bottom-color: ${colors.base0C};
            }

            #battery {
              color: ${colors.base0E};
              border-bottom-color: ${colors.base0E};
            }

            #tray {
              color: ${colors.base05}; /* Foreground */
              border-bottom-color: ${colors.base04};
            }

      '';
    };
}
