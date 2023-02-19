{
  host_name = import /home/nixos/.config/particularisation_config/host_name.nix; 
  domain_name = import /home/nixos/.config/particularisation_config/domain_name.nix;
  email_address = import /home/nixos/.config/particularisation_config/email_address.nix;
  hostPlatform = {
    system = import /home/nixos/.config/particularisation_config/hostPlatform.system.nix;
    config = import /home/nixos/.config/particularisation_config/hostPlatform.config.nix;  
  };
  external_ip = import /home/nixos/.config/particularisation_config/external_ip;
  local_ip = import /home/nixos/.config/particularisation_config/local_ip;
  public_ssh_key = import /home/nixos/.config/particularisation_config/public_ip_key;
  keys_paths = {
    matrix-synapse_registration_shared_secret = "/var/lib/matrix-synapse/keys/registration_shared_secret";
    matrix-synapse_turn_shared_secret = "/var/lib/matrix-synapse/keys/turn_shared_secret";
    matrix-synapse_turn_shared_secret_string = "/var/lib/matrix-synapse/keys/turn_shared_secret_string";
    matrix-synapse_macaroon_secret_key = "/var/lib/matrix-synapse/keys/macaroon_secret_key";
    matrix-synapse_form_secret = "/var/lib/matrix-synapse/keys/form_secret";
    turn_cli-password = "/var/lib/turn/cli-password";
  };
}
