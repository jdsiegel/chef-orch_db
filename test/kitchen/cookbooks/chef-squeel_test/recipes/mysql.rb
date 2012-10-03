# grab app databag
#
# get included apps
#
# extract info needed for DB and translate into bloo.databases list
node.override['bloo']['databases'] = [
  {
    'name' => 'myapp',
    'user' => 'tekh',
    'password' => 'snargles'
  }
]
node.override['bloo']['db_type'] = 'mysql'

include_recipe "mysql::server"
include_recipe "chef-bloo"
