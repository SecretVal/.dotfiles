{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    extraPackages = [
      (
        pkgs.catppuccin-sddm.override
        {
          flavor = "mocha";
          font = "JetBrainsMono Nerd Font Mono";
          fontSize = "12";
          loginBackground = true;
        }
      )
    ];
  };
}
