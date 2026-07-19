_: {
  flake.nixosModules.core = { lib, ... }: {
    options.host = {
      username = lib.mkOption {
        type = lib.types.str;
        default = "rushabhp";
        description = "Primary user username";
      };
      hostname = lib.mkOption {
        type = lib.types.str;
        default = "netanyahu";
        description = "System hostname";
      };
      timezone = lib.mkOption {
        type = lib.types.str;
        default = "Asia/Kolkata";
        description = "System timezone";
      };
      homeDir = lib.mkOption {
        type = lib.types.str;
        default = "/home/rushabhp";
        description = "User home directory";
      };
      flakeDir = lib.mkOption {
        type = lib.types.str;
        default = "/home/rushabhp/nixconf";
        description = "Path to the nixconf flake";
      };
    };
  };
}
