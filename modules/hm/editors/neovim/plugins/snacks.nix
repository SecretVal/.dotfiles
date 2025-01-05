{...}: {
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        terminal.enable = true;
        notifier.enable = true;
        scratch.enable = true;
        scope.enable = true;
        quickfile.enable = true;
      };
    };
    keymaps = [
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
