{pkgs, ...}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  environment.systemPackages = with pkgs; [
    gtk3
  ];
  environment.sessionVariables = {
    EDITOR = "nvim";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}
