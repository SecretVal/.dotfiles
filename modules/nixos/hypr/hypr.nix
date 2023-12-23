{config, pkgs, ... }:
{
	programs.hyprland = {
		enable = true;
		enableNvidiaPatches = true;
		xwayland.enable = true;
	};
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;

    environment.systemPackages = with pkgs; [
      gtk3
    ];
  }
