{ self, ... }: {
  flake.homeModules.home = { ... }: {

    imports = [
      self.homeModules.git
      self.homeModules.jj
      self.homeModules.fastfetch
      self.homeModules.multimedia
      self.homeModules.eza
      self.homeModules.kitty
      self.homeModules.zen
      self.homeModules.helix
      self.homeModules.mcfly
      self.homeModules.direnv
      self.homeModules.starship
      self.homeModules.btop
      self.homeModules.bat
      self.homeModules.bash

      # Desktop
      self.homeModules.hyprland
      self.homeModules.hyprpaper
      self.homeModules.hypridle
      self.homeModules.hyprlock
      self.homeModules.swaync
      self.homeModules.swayosd
      self.homeModules.xdg
      self.homeModules.rofi
      self.homeModules.wleave
      self.homeModules.cliphist
    ];

    home = {
      username = "rushabhp";
      homeDirectory = "/home/rushabhp";
      stateVersion = "26.05";
      pointerCursor.enable = true;
    };
    programs.home-manager.enable = true;
  };
}
