require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require 'active_record/fixtures'
require 'shoulda'
require 'factory_girl'

ActiveRecord::Schema.verbose = false

begin
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
rescue ArgumentError
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
end

ActiveRecord::Base.configurations = true
ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string    :email
    t.string    :password
  end
end

require File.dirname(__FILE__) + '/../lib/scaler_login' unless defined?(ScalerLogin)
require File.dirname(__FILE__) + '/rails_app/app/models/user'