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
          pull.rebase = true;
          push.autoSetupRemote = true;
          init.defaultBranch = "main";
          rerere.enabled = true;
        };
      };

      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
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
