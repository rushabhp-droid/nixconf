_: {
  flake.nixosModules.gaming = { pkgs, ... }: {

    programs = {
      steam = {
        enable = true;
        # 32-bit library support (needed by many Proton titles)
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      gamemode = {
        enable = true;
        enableRenice = true;
        settings = {
          general = {
            renice = 10;
            softrealtime = "auto";
          };
          gpu = {
            apply_gpu_optimisations = "accept-responsibility";
            gpu_device = 0;
          };
        };
      };
      gamescope = {
        enable = true;
        capSysNice = true;
      };
    };

    # Extra Packages
    environment.systemPackages = with pkgs; [
      mangohud # Vulkan/OpenGL overlay (FPS, temps, frame-times)
      uzdoom # Doom
      protonup-qt # Manage GE-Proton / Proton-TKG versions
      heroic # Epic / GOG / Amazon launcher
      lutris # Multi-runner game manager
      bottles # Wine prefix manager
      winetricks # Wine helper scripts
      protontricks # Proton-specific winetricks wrapper
      prismlauncher # Minecraft Launcher
    ];
  };
}
