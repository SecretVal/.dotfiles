{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "catppuccin-mocha";
  };
  environment.systemPackages = [
    pkgs.catppuccin-sddm
  ];
}
