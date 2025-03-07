{
  pkgs,
  ...
}: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        icons = "awesome6";
        theme = "srcery";
        blocks = [
          {
            block = "disk_space";
            path = "/home/lukas/Documents/coding";
            format = "You can code $free Spaghetti Code";
          }
          {
            block = "tea_timer";
            format = "$icon {$minutes:$seconds |}";
            done_cmd = "notify-send 'Get your tee!'";
          }
          {
            block = "sound";
            format = "$icon $volume";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
      };
    };
  };
  home.packages = with pkgs; [
    libnotify
  ];
}
