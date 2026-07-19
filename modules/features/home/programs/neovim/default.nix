{ inputs, ... }: {
  flake.homeModules.neovim = { ... }: {
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

        telescope.enable = true;
      };
    };
  };
}
