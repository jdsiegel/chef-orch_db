node.override['orch_db']['databases'] = [
  {
    'name' => 'myapp',
    'user' => 'tekh',
    'password' => 'snargles'
  }
]
node.override['orch_db']['db_type'] = 'postgres'

include_recipe "postgresql::ruby"
include_recipe "postgresql::server"
