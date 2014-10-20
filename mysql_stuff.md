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
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session1: select * from test;
 * session2: select * from test;
 * session3: select * from INNODB_TRX\G -- take a look and observe 
 * session2: delete from test where id=7;
 * session1: select * from test; => will still show id=7
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session1: update test set id=10 where id=7; => Lock wait timeout exceeded; try restarting transaction
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session2: commit;
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session1: select * from test; will still show id=7... this is REPEATABLE-READ
 * session1: update test set id=10 where id=7; => Rows matched: 0  Changed: 0  Warnings: 0 ... phantom row

 ***

 **Under READ-COMMITTED** 

 * session1: start transaction;
 * session2: start transaction;
 * session3: select * from INNODB_TRX\G -- take a look and observe 
 * session1: select * from test;
 * session2: select * from test;
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session2: delete from test where id=6;
 * session1: select * from test; => will still show id=6
 * session3: select * from INNODB_TRX\G -- take a look and observe    
 * session1: update test set id=10 where id=7; => Lock wait timeout exceeded; try restarting transaction
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session2: insert into test values (8);
 * session2: insert into test values (9);
 * session2: commit;
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session1: select * from test; => id 8 and 9 will be read , this is READ-COMMITTED ... phantom row
 * session3: select * from INNODB_TRX\G -- take a look and observe
 * session1: update test set id=10 where id=6; => Rows matched: 0  Changed: 0  Warnings: 0 ... phantom row

 ***
