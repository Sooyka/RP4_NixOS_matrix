{particularisation_config, fan_controller, pkgs}:
{
  enable = true;
  description = "Fan service";
  path = with pkgs; [
    fan_controller
    lm_sensors
    (python3.withPackages (ps: with ps; [ libgpiod python-periphery ]))
  ];
  serviceConfig = {
    Type = "simple";
    User = "nixos";
    ExecStart = 
      "python3 fan_controller.py";
   };
  wantedBy = [ "multi-user.target" ];
}
