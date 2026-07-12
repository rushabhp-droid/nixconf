{ self, inputs, ... }: {
  flake.nixosModules.librepods = { pkgs, ... }: {
    nixpkgs.overlays = [self.overlays.librepods];
    programs.librepods.enable = true;
  };
}
