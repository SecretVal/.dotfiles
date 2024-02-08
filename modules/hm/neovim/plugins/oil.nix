{ ... }:
{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      skipConfirmForSimpleEdits = true;
      promptSaveOnSelectNewEntry = false;
    };
    keymaps = [
      {
        key = "<leader>pe";
        action = "<cmd>Oil --float<cr>";
      }
    ];
  };
}
