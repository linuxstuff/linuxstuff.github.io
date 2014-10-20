# Mysql ...

 **change the mysql root password**
 
 * create a file containing this lines:

 >     UPDATE mysql.user SET Password=PASSWORD('yourpass') WHERE User='root';
 >     flush privileges;

 * /etc/init.d/mysql stop
 * mysqld_safe --init-file=/home/user/mysql_recover_pass.sql &
 * /etc/init.d/mysql restart

 ***

 **Under REPEATABLE-READ**

 * session1: start transaction;
 * session2: start transaction;
 *
 * session2: delete from test where id=7;
 * session1: select * from test; => will still show id=7
 *
 * session1: update test set id=10 where id=7; => Lock wait timeout exceeded; try restarting transaction
 *
 * session2: commit;
 * session1: select * from test; will still show id=7... this is REPEATABLE-READ
 * session1: update test set id=10 where id=7; => Rows matched: 0  Changed: 0  Warnings: 0 ... phantom row


 **Under READ-COMMITTED** 
