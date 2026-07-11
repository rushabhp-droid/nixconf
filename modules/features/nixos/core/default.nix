_: {
  flake.nixosModules.core = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vim
      git
      wget
    ];
  };
}
