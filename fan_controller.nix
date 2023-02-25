{particularisation_config, fan_controller, pkgs}:
{
  enable = true;
  description = "Fan service";
  path = with pkgs; [
    fan_controller.defaultPackage."aarch64-linux"
    lm_sensors
    (python3.withPackages (ps: with ps; [ libgpiod python-periphery ]))
  ];
  script = "fan_controller.py";
  serviceConfig = {
    Type = "simple";
    User = "nixos";
  };
  wantedBy = [ "multi-user.target" ];
}
