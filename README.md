# bookStack
LEMP Bookstack server

1. Run install_Services.sh
2. Check nginx for open ports
3. Edit php.ini
  a. vim /etc/php/7.0/cli/php.ini (may vary by version)
  b. Uncomment "cgi.fix_pathinfo=0"
4. Run verify_Services.sh
5. Setup DB credentials
  a. mysql_secure_installation
    i. If that does not work
        #shell
      A. sudo mysql -u root
        #mysql
      B. Use mysql;
      C. Update user set password=PASSWORD("changeME") where User='root';
      D. Flush privileges;
      E. Quit
      F. sudo /etc/init.d/mysql stop #shell
      G. sudo /etc/init.d/mysql start
6. Create new Database
    #shell
  a. mysql -u root -p
  b. changeME
    #mysql
  c. Create database bookstackdb;
  d. Create user bookstak@localhost identified by 'changeME';
  e. Grant all privileges on bookstackdb.* to bookstak@localhost identified by 'changeME';
  f. Flush privileges
  g. Exit;
7. Setup DB pointer
  a. cd /var/www/BookStack
  b. sudo vim .env
    i. Edit the following
      DB_HOST=localhost
      DB_DATABASE=bookstackdb
      DB_USERNAME=bookstak
      DV_PASSWORD=changeME
8. Setup Nginx available site
  a. cd /etc/nginx
  b. sudo vim sites-avaliable/bookstack
    i. Either copy or link nginx_bookstack to this file
9. Run siteLink.sh
10. Create a DNS A-record
