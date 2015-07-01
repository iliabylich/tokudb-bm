require 'yaml'
database_config = YAML.load_file(ROOT.join('config/database.yml'))
ActiveRecord::Base.establish_connection(database_config)
# ActiveRecord::Base.logger = Logger.new(STDOUT)
