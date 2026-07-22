_: {
  flake.nixosModules.firewall = _: {
    networking = {
      nftables = {
        enable = true;
      };
      firewall = {
        enable = true;
        allowedTCPPorts = [ 53317 ];
        allowedUDPPorts = [ ];
      };
    };
  };
}
