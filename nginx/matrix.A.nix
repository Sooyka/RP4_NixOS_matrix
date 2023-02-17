{
  forceSSL = true;
  enableACME = true;
  
  locations."/" = {
    root = "/var/https_server/matrix";
  };
  
  locations."/static/" = {
    return = "301 https://$server_name/_matrix/static";
  };  
  
  listen = {
    port = "8448";
    ssl = true;
    addr = "default_server";
  };
  
  locations."/_matrix" = {
    proxyPass = "http://[::1]:8008";
    extraConfig = "proxy_set_header X-Forwarded-For $remote_addr;" + "client_max_body_size 200M;";
    
  };
  
  locations."/_synapse/client" = {
    proxyPass = "http://[::1]:8008";
    extraConfig = "proxy_set_header X-Forwarded-For $remote_addr;" + "client_max_body_size 200M;";
  };
  
}