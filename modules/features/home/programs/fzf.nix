_: {
  flake.homeModules.fzf = _: {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      historyWidget.command = "";
    };
  };
}
