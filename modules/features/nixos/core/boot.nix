{ self, ... }: {

  flake.nixosModules.core = { pkgs, ... }: {
    nixpkgs.overlays = [
      self.overlays.cachyos
    ];

    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linux-cachyos-latest-x86_64-v3;
    };
  };
}
