{config, pkgs, ...}:
{
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./theme.nix { inherit pkgs; }}";
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2   
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
