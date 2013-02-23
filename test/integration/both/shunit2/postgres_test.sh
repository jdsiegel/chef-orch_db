#!/bin/bash

user="pg_user"
password="snargles1"
database="pg_db"

run_sql()
{
  PGPASSWORD="$password" psql --host=localhost --username=$user --no-password --quiet $database
}

test_database_exists()
{
  run_sql <<<exit
  assertTrue "unable to connect to $database database" $?
}

test_create_table()
{
  run_sql <<SQL
DROP TABLE IF EXISTS users; CREATE TABLE users (id integer not null, name text)
SQL
  assertTrue "unable to create table in $database database" $?
}
