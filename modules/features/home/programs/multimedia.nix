_: {
  flake.homeModules.multimedia = { pkgs, ... }: {
    home.packages = with pkgs; [
      ffmpeg
      celluloid
      mpv
      gapless
      yt-dlp
      stremio-linux-shell
      qbittorrent
      varia
      shortwave
      loupe
      celluloid
      aria2
    ];

    programs.yt-dlp = {
      enable = true;
      settings = {
        color = [
          "stdout:no_color"
          "stderr:always"
        ];
        downloader = "aria2c";
        downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
        embed-subs = true;
        embed-thumbnail = true;
        sub-langs = "all";
      };
    };
  };
}
