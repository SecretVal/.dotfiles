{...}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>pf" = "find_files";
        "<leader>pb" = "buffers";
        "<leader>ps" = "live_grep";
        "<leader>pg" = "grep_string";
        "<C-p>" = "git_files";
      };
      extensions.ui-select = {
        enable = true;
        settings.specific_opts.codeactions = true;
      };
    };
    keymaps = [
      {
        key = "<leader>gw";
        action.__raw =
          #lua
          ''            function()
                          require('telescope').extensions.git_worktree.git_worktrees()
                      end'';
      }
      {
        key = "<leader>gaw";
        action.__raw =
          #lua
          ''
            function()
              require('telescope').extensions.git_worktree.create_git_worktree()
            end'';
      }
    ];
  };
}
