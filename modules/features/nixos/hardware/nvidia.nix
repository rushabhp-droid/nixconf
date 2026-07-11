_: {

  flake.nixosModules.nvidia = { config, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.blacklistedKernelModules = [ "nouveau" ];
    hardware = {
      graphics.enable = true;
      nvidia = {
        modesetting.enable = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        nvidiaSettings = true;

        powerManagement = {
          enable = true;
          finegrained = true;
        };
      };
    };
  };
}
