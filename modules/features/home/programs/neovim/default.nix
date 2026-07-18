{ self, inputs, ... }: {
  flake.homeModules.neovim = _: {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;

      plugins = {

        bufferline.enable = true;
        lualine.enable = true;

      };
    };
  };
}
