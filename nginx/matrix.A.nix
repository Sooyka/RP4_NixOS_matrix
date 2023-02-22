{particularisation_config}:
{
  forceSSL = true;
  enableACME = true;
  
  # locations."/" = {
  #   root = "/var/https_server/matrix";
  # };
  
  locations."/" = {
    return = "301 https://$server_name/_matrix/static";
  };  
  
  listen = [
  {
    port = 80;
    addr = "0.0.0.0";
  } 
  {
    port = 443;
    ssl = true;
    addr = "0.0.0.0";
  } 
  {
    port = 8448;
    ssl = true;
    addr = "0.0.0.0"; 
    extraParameters = ["default_server"];
  }
  {
    port = 80;
    addr = "[::0]";
  } 
  {
    port = 443;
    ssl = true;
    addr = "[::0]";
  } 
  {
    port = 8448;
    ssl = true;
    addr = "[::0]"; 
    extraParameters = ["default_server"];
  }
  ];
  
  locations."/_matrix" = {
    proxyPass = "http://[::1]:8008";
    extraConfig = "proxy_set_header X-Forwarded-For $remote_addr;" + "client_max_body_size ${particularisation_config.matrix-synapse_max_upload_size};";
    
  };
  
  locations."/_synapse/client" = {
    proxyPass = "http://[::1]:8008";
    extraConfig = "proxy_set_header X-Forwarded-For $remote_addr;" + "client_max_body_size ${particularisation_config.matrix-synapse_max_upload_size};";
  };
  
}