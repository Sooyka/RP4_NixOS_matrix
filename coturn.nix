{particularisation_config, ...}:
{
  enable = true;
  min-port = particularisation_config.turn_minimal_listening_port;
  max-port = particularisation_config.turn_maximal_listening_port;
  use-auth-secret = true;
  static-auth-secret = particularisation_config.matrix-synapse_turn_shared_secret_coturn;
  realm = particularisation_config.domain_name;
  no-udp = true;
  no-tcp = true;
  no-tcp-relay = true;
  no-cli = true;
  cert = "/var/lib/acme/turn.${particularisation_config.domain_name}/fullchain.pem";
  pkey = "/var/lib/acme/turn.${particularisation_config.domain_name}/key.pem";
  # dh-file = ;
  cli-password = particularisation_config.turn_cli-password;
  extraConfig = ''
    verbose
    user-quota=12
    total-quota=1200
    syslog
    
    no-multicast-peers
    allowed-peer-ip=${particularisation_config.local_ip}
    external-ip=${particularisation_config.external_ip}
    no-tlsv1
    no-tlsv1_1
    no-rfc5780
    no-stun-backwards-compatibility
    response-origin-only-with-rfc5780
  '';  
}