require File.dirname(__FILE__) + "/rails/routes"
require File.dirname(__FILE__) + "/rails/warden_compat"

if defined?(Rails)
  if defined?(ActiveRecord)
    ActiveRecord::Base.extend ::ScalerLogin::Models::Base
  end
  
  # Adds Warden Manager to Railsmiddleware stack, configuring default ScalerLogin
  # strategies, defines default failure app
  Rails.configuration.middleware.use Warden::Manager do |manager|
    ::ScalerLogin.configure_warden_manager(manager)
  end
end