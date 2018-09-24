# bookStack
LEMP Bookstack server

1. Run install_Services.sh
2. Check nginx for open ports
3. Edit php.ini
  a. vim /etc/php/7.0/cli/php.ini (may vary by version)
  b. Uncomment "cgi.fix_pathinfo=0"
4. Run verify_Services.sh
