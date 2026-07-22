{ self, ... }: {
  flake.homeModules.home = { host, pkgs, ... }: {

    imports = [
      self.homeModules.git
      self.homeModules.jj
      self.homeModules.fastfetch
      self.homeModules.multimedia
      self.homeModules.eza
      self.homeModules.kitty
      self.homeModules.zen
      self.homeModules.helix
      self.homeModules.neovim
      self.homeModules.mcfly
      self.homeModules.fzf
      self.homeModules.zoxide
      self.homeModules.direnv
      self.homeModules.starship
      self.homeModules.zathura
      self.homeModules.lf
      self.homeModules.btop
      self.homeModules.bat
      self.homeModules.bash

      # Desktop
      self.homeModules.hyprland
      self.homeModules.hyprpaper
      self.homeModules.hypridle
      self.homeModules.hyprlock
      self.homeModules.waybar
      self.homeModules.swaync
      self.homeModules.swayosd
      self.homeModules.xdg
      self.homeModules.rofi
      self.homeModules.wleave
      self.homeModules.cliphist
    ];

    home = {
      inherit (host) username;
      homeDirectory = host.homeDir;
      stateVersion = "26.05";
      pointerCursor.enable = true;
      packages = with pkgs; [
        localsend
        kdePackages.okular
      ];
    };
    programs.home-manager.enable = true;
  };
}
