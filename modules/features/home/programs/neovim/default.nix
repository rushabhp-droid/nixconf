{ self, inputs, ... }: {
  flake.homeModules.neovim = { lib, ... }: {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;

      plugins = {
        lualine.enable = true;
        bufferline.enable = true;

        alpha = {
          enable = true;
          theme = "dashboard";
        };
      };
    };
  };
}
