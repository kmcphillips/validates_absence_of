ENV["RAILS_ENV"] = "test"
require 'rubygems'
require 'spec'
require 'active_record'

require File.dirname(__FILE__) + '/../init'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['sqlite3mem'])

ActiveRecord::Migration.verbose = false
load(File.dirname(__FILE__) + "/schema.rb")

Spec::Runner.configure do |config|
end
