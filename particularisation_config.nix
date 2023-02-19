{
  host_name = "RP4-NixOS"; 
  domain_name = "sooyka.xyz";
  email_address = "bartosz.sjka@protonmail.com";
  hostPlatform = {
    system = "aarch64-linux";
    config = "aarch64-unknown-linux-gnu";  
  };
  external_ip = "88.156.93.87";
  local_ip = "192.168.89.242";
  public_ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOL3TnbqO+bgzwQAZW+kEm1u0l7EBqOcU1/MlFRg8+lZ bartosz@hp-debian";
  ddclient_configFile = "/home/nixos/.config/particularisation_config/ddclient_configFile.conf";
  keys_paths = {
    matrix-synapse_registration_shared_secret = "/var/lib/matrix-synapse/keys/registration_shared_secret";
    matrix-synapse_turn_shared_secret = "/var/lib/matrix-synapse/keys/turn_shared_secret";
    matrix-synapse_turn_shared_secret_string = "/var/lib/matrix-synapse/keys/turn_shared_secret_string";
    matrix-synapse_macaroon_secret_key = "/var/lib/matrix-synapse/keys/macaroon_secret_key";
    matrix-synapse_form_secret = "/var/lib/matrix-synapse/keys/form_secret";
    turn_cli-password = "/var/lib/turn/cli-password";
  };
}
