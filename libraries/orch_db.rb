module OrchDb
  class PostgresHelper
    attr_reader :db_provider, :user_provider, :connection, :recipe

    def initialize(recipe)
      @recipe        = recipe
      @db_provider   = Chef::Provider::Database::Postgresql
      @user_provider = Chef::Provider::Database::PostgresqlUser
      @connection    = {
        :host => 'localhost',
        :username => 'postgres',
        :password => recipe.node['postgresql']['password']['postgres']
      }
    end

    def setup
      recipe.include_recipe "postgresql::ruby"
      recipe.include_recipe "postgresql::server"
    end
  end

  class MysqlHelper
    attr_reader :db_provider, :user_provider, :connection, :recipe

    def initialize(recipe)
      @recipe        = recipe
      @db_provider   = Chef::Provider::Database::Mysql
      @user_provider = Chef::Provider::Database::MysqlUser
      @connection    = {
        :host => 'localhost',
        :username => 'root',
        :password => recipe.node['mysql']['server_root_password']
      }
    end

    def setup
      recipe.include_recipe "mysql::server"

      recipe.gem_package "mysql" do
        action :install
      end
    end
  end

  HELPER_CLASSES = {
    "postgres" => PostgresHelper,
    "mysql" => MysqlHelper
  }

  def db_helper(type)
    raise "Database type #{type} not found" unless HELPER_CLASSES.has_key?(type)

    @db_helpers ||= Hash.new { |h, k| h[k] = HELPER_CLASSES.fetch(k).new(self) }
    @db_helpers[type]
  end
end
