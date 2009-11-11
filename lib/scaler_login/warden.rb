begin
  require 'warden'
rescue
  gem 'warden'
  require 'warden'
end

require File.dirname(__FILE__) + "/strategies/base"        # Strategies for Warden