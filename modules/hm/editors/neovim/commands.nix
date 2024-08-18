{...}: {
  programs.nixvim.userCommands = {
    "T" = {
      command = "split | term <args>";
      nargs = "*";
    };
  };
}
