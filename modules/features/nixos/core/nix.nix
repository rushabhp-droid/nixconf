_: {
  flake.nixosModules.core = { config, ... }: {

    nixpkgs.config.allowUnfree = true;

    programs = {
      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = config.host.flakeDir;
        aliases = {
          rebuild = "os switch -- --accept-flake-config";
          update = "os update -- --accept-flake-config";
          clean = "clean all -- --accept-flake-config";
        };
      };

      nix-ld = {
        enable = true;
      };
    };

    nix = {
      settings = {
        auto-optimise-store = true;
        substituters = [
          "https://attic.xuyh0120.win/lantian"
          "https://kryptoaries.cachix.org"
        ];
        trusted-public-keys = [
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
          "kryptoaries.cachix.org-1:FZWVC6eJRQqUM+I/Qal+SgWf20w8roz5IzhDEbG/WiM="
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
