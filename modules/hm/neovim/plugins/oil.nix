{...}: {
  programs.nixvim.plugins.oil = {
    enable = true;
    skipConfirmForSimpleEdits = true;
    promptSaveOnSelectNewEntry = false;
  };
}
