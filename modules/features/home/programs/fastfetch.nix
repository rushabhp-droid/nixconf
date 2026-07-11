_: {
  flake.homeModules.fastfetch = _: {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            right = 1;
          };
        };
        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "blue";
          separator = "  ";
        };
        modules = [
          {
            type = "datetime";
            key = "Date";
            format = "{1}-{3}-{11}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}:{20}";
          }
          {
            type = "cpu";
            format = "{name} ({cores-physical}C/{cores-logical}T) @ {freq-max}";
          }
          {
            type = "gpu";
            key = "GPU";
          }
          "break"
          {
            type = "memory";
            key = "Memory";
            percent = {
              type = 3;
              green = 30;
              yellow = 70;
            };
          }
          "break"
          "player"
          "media"
        ];

      };
    };
  };
}
