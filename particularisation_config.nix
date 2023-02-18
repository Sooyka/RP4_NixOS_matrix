{
  host_name = import /home/nixos/.config/particularisation_config/host_name.nix; 
  domain_name = import /home/nixos/.config/particularisation_config/domain_name.nix;
  email_address = import /home/nixos/.config/particularisation_config/email_address.nix;
  hostPlatform = {
    system = import /home/nixos/.config/particularisation_config/hostPlatform.system.nix;
    config = import /home/nixos/.config/particularisation_config/hostPlatform.config.nix;  
  };
  keys_paths = {
    matrix-synapse_registration_shared_secret = "/home/nixos/.config/keys/matrix-synapse_registration_shared_secret";
    matrix-synapse_turn_shared_secret = "/home/nixos/.config/keys/matrix-synapse_turn_shared_secret";
    matrix-synapse_macaroon_secret_key = "/home/nixos/.config/keys/matrix-synapse_macaroon_secret_key";
    matrix-synapse_form_secret = "/home/nixos/.config/keys/matrix-synapse_form_secret";
  };
}
