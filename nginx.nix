# let 
#   particularisation_config = import ./particularisation_config.nix;
# in
{particularisation_config}:
{
  recommendedTlsSettings = true;
  recommendedOptimisation = true;
  recommendedGzipSettings = true;
  recommendedProxySettings = true;
  enable = true;
  # logError = "/home/nixos/https_server/log_error";  
  # logError = "syslog: warn"; 
  virtualHosts = {
    "matrix.${particularisation_config.domain_name}" = (import ./nginx/matrix.A.nix) {particularisation_config = particularisation_config;};
    "turn.${particularisation_config.domain_name}" = import ./nginx/turn.A.nix;
  };
}