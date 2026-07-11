_: {
  flake.nixosModules.hyprland = { pkgs, ... }: {

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
      libinput.enable = true;
      blueman.enable = true;
    };

    security.polkit.enable = true;

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # File Browser
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs; [
          thunar-archive-plugin
          thunar-volman
        ];
      };

      xfconf.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Hypr Eco System
      hyprpolkitagent
      hyprpwcenter

      # Desktop
      gnome-text-editor # GUI text editor
      brightnessctl
      playerctl

      # Clipboard
      wl-clipboard

      # Screenshot
      grim
      slurp
      swappy
      file-roller
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
