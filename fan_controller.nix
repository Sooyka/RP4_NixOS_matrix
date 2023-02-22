{
  enable = true;
  description = "Fan service";
  serviceConfig = {
    Type = "simple";
    ExecStart = 
    let 
      python = (pkgs.python3.withPackages (ps: with ps; [ libgpiod python-periphery ]));  
    in 
      "${python.interpreter} fan_controller.py";
   };
}
