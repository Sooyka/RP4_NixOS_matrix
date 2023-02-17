{
  host_name = import /home/nixos/.config/particularisation_config/host_name.nix; 
  domain_name = import /home/nixos/.config/particularisation_config/domain_name.nix;
  email_address = import /home/nixos/.config/particularisation_config/email_address.nix;
  hostPlatform = {
    system = import /home/nixos/.config/particularisation_config/hostPlatform.system.nix;
    config = import /home/nixos/.config/particularisation_config/hostPlatform.config.nix;  
  };
}
