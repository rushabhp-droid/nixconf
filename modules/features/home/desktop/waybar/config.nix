_: {
  flake.homeModules.waybar = _: {
    programs.waybar.settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
          "custom/separator#left"
        ];

        modules-center = [ "hyprland/window" ];

        modules-right = [
          "custom/separator#1"
          "tray"
          "custom/separator#2"
          "network"
          "custom/separator#3"
          "battery"
          "custom/separator#4"
          "cpu"
          "custom/separator#5"
          "memory"
          "custom/separator#6"
          "disk"
          "custom/separator#7"
          "clock"
          "custom/separator#8"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
        };

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        network = {
          format-wifi = "Online";
          format-ethernet = "Online";
          format-disconnected = "Offline";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        battery = {
          format = "BAT: {capacity}%";
        };

        cpu = {
          format = "CPU: {usage}%";
          tooltip = false;
        };

        memory = {
          format = "Mem: {used:0.1f}GiB";
          tooltip = false;
        };

        disk = {
          interval = 30;
          format = "Disk: {used}";
          path = "/";
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };
  };
}
