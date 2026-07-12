{ self, inputs, ... }: {
  flake.nixosModules.librepods = { pkgs, ... }: {
    programs.librepods.enable = true;
  };
}
