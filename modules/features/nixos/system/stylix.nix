{ inputs, ... }: {

  flake.nixosModules.stylix = { pkgs, ... }: {

    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;

      image = ../../../../wallpapers/linux-purple.png;

      polarity = "dark";

      icons = {
        enable = true;
        package = pkgs.whitesur-icon-theme;
        dark = "WhiteSur-dark";
        light = "WhiteSur";
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };

      fonts = {
        monospace = {
          name = "JetBrainsMono Nerd font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

        sizes = {
          desktop = 15.0;
        };
      };

      opacity = {
        terminal = 0.65;
        popups = 0.65;
      };
    };

  };

}
