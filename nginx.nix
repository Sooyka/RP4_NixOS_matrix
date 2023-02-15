{
  enable = true;
  
  appendConfig = import ./sooyka_conf;
  appendCOnfig = import ./www_sooyka_conf; 
  appendConfig = import ./matrix_sooyka_conf;
  appendConfig = import ./turn_sooyka_conf;
}