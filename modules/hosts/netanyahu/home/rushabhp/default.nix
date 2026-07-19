{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { config, ... }: {
    imports = [
      # Flake Input
      inputs.home-manager.nixosModules.home-manager

      # Home Modules
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit inputs;
        host = {
          inherit (config.host)
            username
            hostname
            homeDir
            flakeDir
            ;
        };
      };
      users.rushabhp = self.homeModules.home;
    };
  };
}
