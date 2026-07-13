{ self, ... }: {
  flake.nixosModules.librepods = _: {
    nixpkgs.overlays = [ self.overlays.librepods ];
    programs.librepods.enable = true;
  };
}
