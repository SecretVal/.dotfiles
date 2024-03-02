{...}: {
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      skipConfirmForSimpleEdits = true;
      promptSaveOnSelectNewEntry = false;
      viewOptions.showHidden = true;
    };
    keymaps = [
      {
        key = "<leader>pe";
        action = "<cmd>Oil --float<cr>";
      }
    ];
  };
}
