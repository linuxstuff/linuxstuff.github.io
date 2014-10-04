# Mysql ...

 **change the mysql root password**
 
 * create a file containing this lines:
 >     UPDATE mysql.user SET Password=PASSWORD('yourpass') WHERE User='root';
 >     flush privileges;

 * /etc/init.d/mysql stop
 * mysqld_safe --init-file=/home/user/mysql_recover_pass.sql &
 * /etc/init.d/mysql restart

 ***


