_: {
  flake.homeModules.jj = _: {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Rushabh Patil";
          email = "rushabhpatil3407@gmail.com";
        };
      };
    };
  };
}
