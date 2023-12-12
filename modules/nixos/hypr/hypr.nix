{config, pkgs, ... }:
{
	programs.hyprland = {
		enable = true;
		enableNvidiaPatches = true;
		xwayland.enable = true;
	};
	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
		WLR_RENDERER_ALLOW_SOFTWARE="1";
	};
	hardware = {
		nvidia.modesetting.enable = true;
	};
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;

    environment.systemPackages = with pkgs; [
      gtk3
    ];
  }
