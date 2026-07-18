_: {
  flake.homeModules.neovim = _: {
    programs.nixvim.plugins.lualine = {
      enable = true;
    };
  };
}
