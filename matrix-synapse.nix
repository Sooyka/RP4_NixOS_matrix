{particularisation_config}:
{
  enable = true;
  settings = {
    server_name = "https://matrix." + particularisation_config.domain_name;
    public_baseurl = "https://matrix." + particularisation_config.domain_name + ":8448/";
    listeners = [
      {
        port = 8008;
        bind_addresses = [ "::1" ];
        type = "http";
        tls = false;
        x_forwarded = true;
        resources =[
          {
            names = [ "client" "federation" ];
            compress = false;
          }
        ];
      }
    ]; 
    database = {
      name = "sqlite3";
      args.user = null;
    };
    max_upload_size = particularisation_config.matrix-synapse_max_upload_size;
    # report_stats = true;
    allow_guest_access = false;
    
    turn_uris = [ 
      "turns:turn.${particularisation_config.domain_name}?transport=udp" 
      "turns:turn.${particularisation_config.domain_name}?transport=tcp"
    ];
    turn_user_lifetime = "1h";
    turn_allow_guests = false;
  };
  extraConfigFiles = [ 
    particularisation_config.keys_paths.matrix-synapse_registration_shared_secret
    particularisation_config.keys_paths.matrix-synapse_turn_shared_secret
  ];
}