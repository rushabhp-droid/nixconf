_: {
  flake.nixosModules.core = _: {
    users.users."rushabhp" = {
      isNormalUser = true;
      description = "Rushabh Patil";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
      ];
      packages = [ ];
    };

    security.sudo = {
      enable = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults pwfeedback, insults
      '';
    };
  };
}
