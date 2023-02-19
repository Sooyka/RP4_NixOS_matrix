# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, rp4_hardware, fan_controller, ... }:
let
    device = "raspberry-pi/4";
    particularisation_config = import ./particularisation_config.nix;
    matrix-synapse_config = (import ./matrix-synapse.nix) {particularisation_config = particularisation_config;};
    coturn_config = (import ./coturn.nix) {particularisation_config = particularisation_config;};
    nginx_config = (import ./nginx.nix) {particularisation_config = particularisation_config;};
in
{
  imports = [  
    rp4_hardware.nixosModules.raspberry-pi-4
  ];

  # fileSystems = {
  #   "/" = {
  #     device = "/dev/disk/by-label/NIXOS_SD";
  #     fsType = "ext4";
  #     options = [ "noatime" ];
  #   };
  # };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.raspberry-pi."4".pwm0.enable = true;

  nixpkgs.hostPlatform = { system = particularisation_config.hostPlatform.system; config = particularisation_config.hostPlatform.config; };

#  boot = {
#    kernelPackages = pkgs.linuxPackages_rpi4;
#    tmpOnTmpfs = true;
#    initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
#    # ttyAMA0 is the serial console broken out to the GPIO
#    kernelParams = [
#        "8250.nr_uarts=1"
#        "console=ttyAMA0,115200"
#        "console=tty1"
#        # A lot GUI programs need this, nearly all wayland applications
#        "cma=128M"
#    ];
#  };

 # boot.loader.raspberryPi = {
 #   enable = true;
 #   version = 4;
 # };
 # boot.loader.grub.enable = false;
 # boot.loader.generic-extlinux-compatible.enable = true;
  # Required for the Wireless firmware
#  hardware.enableRedistributableFirmware = true;  

  programs.bash.loginShellInit = "source ~/.bashrc";  

  # Create gpio group
  users.groups.gpio = {};


  # Change permissions gpio devices
  services.udev.extraRules = ''
    SUBSYSTEM=="bcm2835-gpiomem", KERNEL=="gpiomem", GROUP="gpio",MODE="0660"
    SUBSYSTEM=="gpio", KERNEL=="gpiochip*", ACTION=="add", RUN+="${pkgs.bash}/bin/bash -c 'chown root:gpio  /sys/class/gpio/export /sys/class/gpio/unexport ; chmod 220 /sys/class/gpio/export /sys/class/gpio/unexport'"
    SUBSYSTEM=="gpio", KERNEL=="gpio*", ACTION=="add",RUN+="${pkgs.bash}/bin/bash -c 'chown root:gpio /sys%p/active_low /sys%p/direction /sys%p/edge /sys%p/value ; chmod 660 /sys%p/active_low /sys%p/direction /sys%p/edge /sys%p/value'"
    SUBSYSTEM=="pwm*", ACTION=="add|change", RUN +="${pkgs.bash}/bin/bash - c 'chown -R root:gpio /sys/class/pwm/ && chmod -R 770 /sys/class/pwm/;\ 
    chown -R root:gpio /sys/class/pwm/pwmchip0/ && chmod -R 770 /sys/class/pwm/pwmchip0/;\
    chown -R root:gpio /sys/class/pwm/pwmchip0/pwm0/ && chmod -R 770 /sys/class/pwm/pwmchip0/pwm0/;\
    chown -R root:gpio /sys/devices/platform/soc/fe20c000.pwm/pwm/pwmchip0/ && chmod -R 770 /sys/devices/platform/soc/fe20c000.pwm/pwm/pwmchip0/ '"
'';

# chown -R root:gpio /sys/class/pwm/pwmchip0/export /sys/class/pwm/pwmchip0/unexport; chmod -R 220 /sys/class/pwm/pwmchip0/export /sys/class/pwm/pwmchip0/unexport;\ 
  
  
    # SUBSYSTEM=="pwm*", PROGRAM="/bin/sh -c '\
    #     chown -R root:gpio /sys/class/pwm && chmod -R 770 /sys/class/pwm;\
    #     chown -R root:gpio /sys/devices/platform/soc/*.spi/spi_master/spi1/spi1.0/pwm/pwmchip0 && chmod -R 770 /sys/devices/platform/soc/*.spi/spi_master/spi1/spi1.0/pwm/pwmchip0\ 
    #     ' " ''



  # Add user to group
  users = {
    users = {
      nixos = {
        extraGroups = [ "gpio" "video" "nginx"];
        isNormalUser = true;     
      };
      nginx.extraGroups = ["turnserver"];
    };
  };

  # gnu = true;

  
  
  environment.systemPackages = [
    (pkgs.python3.withPackages (ps: with ps; [ libgpiod python-periphery ]))
    pkgs.lm_sensors
    pkgs.htop
    pkgs.libraspberrypi
    pkgs.git
    pkgs.helix
    pkgs.nginx
  ];


  programs.git.config = {
    
    init = {
      defaultBranch = "main";
    };
      
  }; 
  
  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  # environment.etc."dupa".text = "test dupy";

  networking.hostName = particularisation_config.host_name; # Define your hostname.
  networking.domain = particularisation_config.domain_name;
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable GPU acceleration
  # hardware.raspberry-pi."4".fkms-3d.enable = true;
  
  # hardware.pulseaudio.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [62442];
    permitRootLogin = "prohibit-password";
  };

  users.extraUsers.root.openssh.authorizedKeys.keys = [ particularisation_config.public_ssh_key ];

  users.users.nixos.openssh.authorizedKeys.keys = [ particularisation_config.public_ssh_key ];
  

  services.matrix-synapse = matrix-synapse_config;
  services.coturn = coturn_config;
    
  services.nginx = nginx_config;
  security.acme = {
    acceptTerms = true;
    defaults.email = particularisation_config.email_address;
    certs."turn.${particularisation_config.domain_name}" = {
      postRun = "systemctl restart coturn";
      group = "turnserver";
    };
  };
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall = {
    allowedTCPPorts = [62442 80 443 8448 5349 5350];
    allowedUDPPortRanges = [ {from = 64000; to = 65535;} ];
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

