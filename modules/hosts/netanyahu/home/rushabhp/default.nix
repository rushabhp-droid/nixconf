{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { ... }: {
    imports = [
      # Flake Input
      inputs.home-manager.nixosModules.home-manager

      # Home Modules
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      users.rushabhp = self.homeModules.home;
    };
  };
}
