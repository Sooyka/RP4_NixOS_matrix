{particularisation_config, fan_controller, pkgs}:
{
  enable = true;
  description = "Fan service";
  path = with pkgs; [
    fan_controller
    pkgs.lm_sensors
    python3.withPackages (ps: with ps; [ libgpiod python-periphery ])
  ];
  serviceConfig = {
    Type = "simple";
    User = "nixos";
    ExecStart = 
      "${python.interpreter} fan_controller.py";
   };
  wantedBy = [ "multi-user.target" ];
}
