{ inputs, ... }: {
  flake.nixosModules.autocpu-freq = { ... }: {
    imports = [ inputs.auto-cpufreq.nixosModules.default ];

    services.thermald.enable = true;

    services.upower.enable = true;

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
