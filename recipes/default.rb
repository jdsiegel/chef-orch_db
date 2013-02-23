include_recipe "database"

postgres_info = { :host => "localhost", :username => 'postgres', :password => node['postgresql']['password']['postgres'] }
mysql_info = { :host => "localhost", :username => 'root', :password => node['mysql']['server_root_password'] }

node['orch_db']['databases'].each do |hash|
  name = hash['name']
  user = hash['user']
  pass = hash['password']
  type = hash.fetch('type') { "postgres" }

  if type == "postgres"
    include_recipe "postgresql::ruby"
    include_recipe "postgresql::server"

    db_provider = Chef::Provider::Database::Postgresql
    user_provider = Chef::Provider::Database::PostgresqlUser
    conn_info = postgres_info
  else
    include_recipe "mysql::server"

    gem_package "mysql" do
      action :install
    end

    db_provider = Chef::Provider::Database::Mysql
    user_provider = Chef::Provider::Database::MysqlUser
    conn_info = mysql_info
  end

  database name do
    connection conn_info
    provider db_provider
    action :create
  end

  database_user user do
    connection conn_info
    password pass
    provider user_provider
    action :create
  end

  database_user user do
    connection conn_info
    password pass
    privileges [:all]
    database_name name
    provider user_provider
    action :grant
  end
end
