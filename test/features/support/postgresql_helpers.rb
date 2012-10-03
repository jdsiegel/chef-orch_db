class PostgresHelper
  def execute(sql)
    ENV["PGPASSWORD"] = test_password
    result = %x{echo "#{sql}" | psql --host=#{test_server_host} --username=#{test_user} --no-password #{test_database}}
    #assert $?.success?
    result
  end

  def test_server_host
    "localhost"
  end

  def test_user
    "tekh"
  end

  def test_password
    "snargles"
  end

  def test_database
    "myapp"
  end

  def create_table(name)
    execute("DROP TABLE IF EXISTS #{name}; CREATE TABLE #{name} (id integer not null, name text)")
  end

  def drop_table(name)
    execute("DROP TABLE #{name}");
  end

  def table_exists?(name)
    result = execute('\\dt')
    result.match /players/
  end

  def insert_row(table, values)
    values = values.map { |v| "'" + v + "'" }.join(",")
    execute("INSERT INTO #{table} VALUES (#{values})")
  end
end
