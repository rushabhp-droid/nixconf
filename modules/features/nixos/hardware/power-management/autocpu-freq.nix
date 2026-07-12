{ inputs, ... }: {
  flake.nixosModules.autocpu-freq = _: {
    imports = [ inputs.auto-cpufreq.nixosModules.default ];

    services.thermald.enable = true;

    powerManagement = {
      enable = true;
      powertop.enable = true;
    };

    services = {
      upower.enable = true;
      power-profiles-daemon.enable = false;
      tlp.enable = false;
    };

    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };
}
