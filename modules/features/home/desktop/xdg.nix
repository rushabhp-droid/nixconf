_: {
  flake.homeModules.xdg =
    { pkgs, ... }:
    let
      browser = "zen-twilight.desktop";
      file-manager = "thunar.desktop";
      image-viewer = "org.gnome.Loupe.desktop";
      video-player = "io.github.celluloid_player.Celluloid.desktop";
    in
    {
      home = {
        packages = with pkgs; [
          xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
          xdg-user-dirs
        ];
      };

      xdg = {
        enable = true;
        mimeApps = rec {
          enable = true;

          associations.added = defaultApplications;
          defaultApplications = {
            "inode/directory" = file-manager;

            "x-scheme-handler/http" = browser;
            "x-scheme-handler/https" = browser;
            "text/html" = browser;

            "image/png" = image-viewer;
            "image/jpeg" = image-viewer;
            "image/gif" = image-viewer;
            "image/svg+xml" = image-viewer;

            "video/mp4" = video-player;
            "video/ogg" = video-player;
          };
        };
      };
    };
}
