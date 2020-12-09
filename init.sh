pass=$(grep 'temporary password' /var/log/mysqld.log | cut -d' ' -f 13)

mysql -uroot -p"$pass" << EOF
set global validate_password.length=0;
set global validate_password.mixed_case_count=0;
set global validate_password.number_count=0;
set global validate_password.policy=0;
set global validate_password.special_char_count=0;

show variables like 'validate%';
alter user  'root'@'localhost' identified with mysql_native_password by '1234';
select user from user;
EOF
create user 'zlh'@'%'  identified with mysql_native_password by 'Abcd!1234';

mysql> create user 'zlh'@'%'  identified with mysql_native_password by 'Abcd!1234';
Query OK, 0 rows affected (0.00 sec)

mysql>  GRANT ALL PRIVILEGES ON *.* to 'zlh'@'%';
Query OK, 0 rows affected (0.01 sec)


