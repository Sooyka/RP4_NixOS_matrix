{particularisation_config, ...}:
{
  enable = true;
  min-port = 64000;
  max-port = 65535;
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
    denied-peer-ip=0.0.0.0-0.255.255.255
    denied-peer-ip=100.64.0.0-100.127.255.255
    denied-peer-ip=169.254.0.0-169.254.255.255
    denied-peer-ip=192.0.0.0-192.0.0.255
    denied-peer-ip=192.0.2.0-192.0.2.255
    denied-peer-ip=192.88.99.0-192.88.99.255
    denied-peer-ip=198.18.0.0-198.19.255.255
    denied-peer-ip=198.51.100.0-198.51.100.255
    denied-peer-ip=203.0.113.0-203.0.113.255
    denied-peer-ip=240.0.0.0-255.255.255.255
    denied-peer-ip=64:ff9b::-64:ff9b::ffff:ffff
    denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255
    denied-peer-ip=100::-100::ffff:ffff:ffff:ffff
    denied-peer-ip=2001::-2001:1ff:ffff:ffff:ffff:ffff:ffff:ffff
    denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    allowed-peer-ip=${particularisation_config.local_ip}
    external-ip=${particularisation_config.external_ip}
  '';  
}