_: {
  flake.nixosModules.core = _: {

    nixpkgs.config.allowUnfree = true;

    programs = {
      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "/home/rushabhp/nixconf";
      };

      nix-ld = {
        enable = true;
      };
    };

    nix = {
      settings = {
        substituters = [ "https://attic.xuyh0120.win/lantian" ];
        trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
