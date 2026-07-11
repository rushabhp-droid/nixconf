{ self, inputs, ... }: {
  flake.nixosConfigurations.netanyahu = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.netanyahuConfiguration ];
  };
}
