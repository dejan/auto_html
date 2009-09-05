module FixtureSetup
  def setup
    fixtures_dir = File.dirname(__FILE__) + '/fixtures'
    connections = YAML.load_file("#{fixtures_dir}/database.yml")
    ActiveRecord::Base.establish_connection(connections['sqlite3'])
    ActiveRecord::Migration.verbose = false
    load "#{fixtures_dir}/schema.rb"
  end
end