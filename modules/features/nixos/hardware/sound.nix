{ inputs, ... }: {
  flake.nixosModules.sound = _: {

    imports = [ inputs.musnix.nixosModules.musnix ];

    musnix.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
