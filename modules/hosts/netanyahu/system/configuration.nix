{ self, inputs, ... }: {
  flake.nixosModules.netanyahuConfiguration = { ... }: {
    imports = [
      # Disk Configuration
      inputs.disko.nixosModules.disko
      { config = self.diskoConfigurations.netanyahu; }

      self.nixosModules.netanyahuHardwareConf

      # Core Configuration
      self.nixosModules.core
      self.nixosModules.home-manager
      self.nixosModules.sound
      self.nixosModules.zram
      self.nixosModules.stylix
      self.nixosModules.bash

      # Hardware
      ## Nvidia
      self.nixosModules.bluetooth
      self.nixosModules.nvidia
      self.nixosModules.nvidia-prime
      self.nixosModules.cardwire

      ## Udev
      self.nixosModules.msi-katana-udev

      # Power Management
      self.nixosModules.autocpu-freq

      # Desktop
      self.nixosModules.sddm
      self.nixosModules.hyprland
    ];

    networking = {
      hostName = "netanyahu";
      networkmanager.enable = true;
    };

    time.timeZone = "Asia/Kolkata";

    system.stateVersion = "26.05";
  };
}
