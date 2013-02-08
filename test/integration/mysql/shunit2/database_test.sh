#!/bin/bash

user="tekh"
password="snargles"
database="myapp"

run_sql()
{
  mysql --user=$user --password=$password $database
}

test_database_exists()
{
  run_sql <<<exit
  assertTrue "unable to connect to $database database" $?
}

test_create_table()
{
  run_sql <<SQL
DROP TABLE IF EXISTS users; CREATE TABLE users (id int not null, name text)
SQL
  assertTrue "unable to create table in $database database" $?
}
