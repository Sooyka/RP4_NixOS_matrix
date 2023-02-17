# let 
#   particularisation_config = import ./particularisation_config.nix;
# in
{particularisation_config, ...}:
{
  enable = true;
  # logError = "/home/nixos/https_server/log_error";  
  # logError = "syslog: warn"; 
  virtualHosts = {
    "${particularisation_config.domain_name}" = import ./nginx/A.nix;
    "www.${particularisation_config.domain_name}" = import ./nginx/www.A.nix;
    # "matrix.${particularisation_config.domain_name}" = import ./nginx/matrix.A.nix;
    # "turn.${particularisation_config.domain_name}" = import ./nginx/turn.A.nix;
  };
}