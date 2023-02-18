{
  enableACME = true;
  forceSSL = true;
  
  locations."/" = {
    root = "/var/https_server";
    index = "coturn_index.html";
  };
}