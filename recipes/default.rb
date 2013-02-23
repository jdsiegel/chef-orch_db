extend OrchDb

include_recipe "database"

node['orch_db']['databases'].each do |hash|
  name = hash['name']
  user = hash['user']
  pass = hash['password']
  type = hash.fetch('type') { "postgres" }

  helper = db_helper(type)
  helper.setup

  database name do
    connection helper.connection
    provider helper.db_provider
    action :create
  end

  database_user user do
    connection helper.connection
    password pass
    provider helper.user_provider
    action :create
  end

  database_user user do
    connection helper.connection
    password pass
    privileges [:all]
    database_name name
    provider helper.user_provider
    action :grant
  end
end
