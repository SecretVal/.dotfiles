{ ... }: {
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        globalstatus = true;
        iconsEnabled = false;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
