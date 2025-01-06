{...}: {
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        dashboard = {
          enable = true;
          sections = [
            {section = "header";}
            {
              icon = " ";
              title = "Keymaps";
              section = "keys";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Recent Files";
              section = "recent_files";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              indent = 2;
              padding = 1;
            }
          ];
        };
        terminal.enable = true;
        notifier.enable = true;
        scratch.enable = true;
        scope.enable = true;
        quickfile.enable = true;
        gitbrowse.enable = true;
        lazygit.enable = true;
      };
    };
    keymaps = [
      {
        key = "<leader>gs";
        action.__raw = ''function() require("snacks").lazygit() end'';
      }
      {
        key = "<leader>.";
        action.__raw = ''function() require("snacks").scratch() end'';
      }
      {
        key = "<leader>s";
        action.__raw = ''function() require("snacks").scratch.select() end'';
      }
      {
        mode = ["n" "v" "t"];
        key = "<leader>t";
        action.__raw = ''function() require("snacks").terminal() end'';
      }
    ];
  };
}
