_: {
  flake.nixosModules.zram = _: {
    zramSwap = {
      enable = true;
      priority = 100;
      algorithm = "zstd";
      memoryPercent = 50;
    };
  };
}
