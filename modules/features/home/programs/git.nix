_: {
  flake.homeModules.git = _: {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "Rushabh Patil";
            email = "rushabhpatil3407@gmail.com";
          };
        };
      };

      gh = {
        enable = true;
        settings = {
          git_protocol = "https";
        };
      };

      lazygit = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}
