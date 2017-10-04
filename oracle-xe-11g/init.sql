CREATE TABLESPACE database_tabspace
  DATAFILE 'database_tabspace.dat'
  SIZE 100M AUTOEXTEND on;

create TEMPORARY TABLESPACE database_tabspace_temp
  TEMPFILE 'database_tabspace_temp.dat'
  SIZE 25M AUTOEXTEND on;

CREATE USER user_db IDENTIFIED by 1234
  default tablespace database_tabspace
  temporary tablespace database_tabspace_temp;


grant all PRIVILEGES to user_db;