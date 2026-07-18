_: {
  flake.homeModules.neovim = _: {
    programs.nixvim.plugins.bufferline = {
      enable = true;
    };
  };
}
