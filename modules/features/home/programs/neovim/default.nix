{ self, inputs, ... }: {

  flake.homeModules.neovim = {
    imports = [ inputs.nvf.homeManagerModules.default ];

    programs.nvf = {
      enable = true;
      settings = {
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp = {
          enable = true;
        };
      };
    };
  };
}
