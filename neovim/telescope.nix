{pkgs, config, nixvim, ...}:
{
  program.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        keymaps = {
          "<leader>pf"="find_files";
          "<C-p>"="git_files";
          "<leader>vh"="help_tags";
        };

      };
    };
  };
}
