{ self, ... }: {

  flake.nixosModules.core = { pkgs, ... }: {
    nixpkgs.overlays = [ self.overlays.cachyos ];

    boot = {
      loader = {
        limine.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;
    };
  };
}
