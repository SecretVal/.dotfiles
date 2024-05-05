{...}: {
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        prompt_save_on_select_new_entry = false;
        view_options.show_hidden = true;
      };
    };
    keymaps = [
      {
        key = "<leader>pe";
        action = "<cmd>Oil<cr>";
      }
    ];
  };
}
