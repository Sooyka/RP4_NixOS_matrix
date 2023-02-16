# let 
#   particularisation_config = import ./particularisation_config.nix;
# in
{
  enable = true;
  # logError = "/home/nixos/https_server/log_error";  
  # logError = "syslog: warn"; 
  virtualHosts = {
    "sooyka.xyz" = import ./nginx/sooyka.xyz.nix;
    # "www.${particularisation_config.domain_name}" = import ./nginx/www_${particularisation_config.domain_name}.nix;
    # "matrix.${particularisation_config.domain_name}" = import ./nginx/matrix_${particularisation_config.domain_name}.nix;
    # "turn.${particularisation_config.domain_name}" = import ./nginx/turn_${particularisation_config.domain_name}.nix;
  };
}