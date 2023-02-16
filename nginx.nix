{
  enable = true;
  # logError = "/home/nixos/https_server/log_error";  
  # logError = "syslog: warn"; 
  virtualHosts = {
    "sooyka.xyz" = import ./nginx/sooyka_xyz.nix;
    # "www.sooyka.xyz" = import ./nginx/www_sooyka_xyz.nix;
    # "matrix.sooyka.xyz" = import ./nginx/matrix_sooyka_xyz.nix;
    # "turn.sooyka.xyz" = import ./nginx/turn_sooyka_xyz.nix;
  };
}