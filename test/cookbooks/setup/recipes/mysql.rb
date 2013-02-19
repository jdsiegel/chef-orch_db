node.override['orch_db']['databases'] = [
  {
    'name' => 'myapp',
    'user' => 'tekh',
    'password' => 'snargles'
  }
]
node.override['orch_db']['db_type'] = 'mysql'
