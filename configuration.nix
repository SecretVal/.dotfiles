# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nixos/hypr
    ./modules/shared
    ./modules/nixos/sddm/sddm.nix
    ./modules/nixos/nivida/nvidia.nix
    ./modules/nixos/kanata
  ];
  #bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true; # blueman

  services.xserver = {
    enable = true;
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
    ];
  };
  # I use nushell btw
  environment.shells = with pkgs; [nushell];
  users.defaultUserShell = pkgs.nushell;
  # thunar
  programs.thunar.enable = true;

  #sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pipewire.wireplumber.enable = true;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernelPackages
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    #    LC_PAPER = "de_DE.UTF-8";
    #    LC_TELEPHONE = "de_DE.UTF-8";
    #    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lukas = {
    isNormalUser = true;
    description = "Lukas";
    extraGroups = ["networkmanager" "wheel"];
    packages = [];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    htop
    git
    gh
    killall

    # gui
    qpwgraph
    pavucontrol
    bluez
    swww

    #dev
    just

    #extra
    bitwarden
    cava
    flameshot
    pkg-config
    openssl
    bat
    nnn
    ripgrep
    rhythmbox
    ffmpeg
  ];
  virtualisation.docker.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.steam.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = /home/lukas/.dotfiles;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system. Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["lukas"];
  services.hardware.openrgb.enable = true;
}
