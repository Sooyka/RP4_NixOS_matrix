# let 
#   particularisation_config = import ./particularisation_config.nix;
# in
{particularisation_config, ...}:
{
  enable = true;
  # logError = "/home/nixos/https_server/log_error";  
  # logError = "syslog: warn"; 
  virtualHosts = {
    "${particularisation_config.domain_name}" = import ./nginx/${particularisation_config.domain_name}.nix;
    "www.${particularisation_config.domain_name}" = import ./nginx/www_${particularisation_config.domain_name}.nix;
    "matrix.${particularisation_config.domain_name}" = import ./nginx/matrix_${particularisation_config.domain_name}.nix;
    "turn.${particularisation_config.domain_name}" = import ./nginx/turn_${particularisation_config.domain_name}.nix;
  };
}