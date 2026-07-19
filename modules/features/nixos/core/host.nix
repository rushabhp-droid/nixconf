_: {
  flake.nixosModules.core = { lib, ... }: {
    options.host = {
      username = {
        type = lib.types.str;
        default = "rushabhp";
        description = "Primary user username";
      };
      hostname = {
        type = lib.types.str;
        default = "netanyahu";
        description = "System hostname";
      };
      timezone = {
        type = lib.types.str;
        default = "Asia/Kolkata";
        description = "System timezone";
      };
      homeDir = {
        type = lib.types.str;
        default = "/home/rushabhp";
        description = "User home directory";
      };
      flakeDir = {
        type = lib.types.str;
        default = "/home/rushabhp/nixconf";
        description = "Path to the nixconf flake";
      };
    };
  };
}
