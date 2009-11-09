class User < ActiveRecord::Base
  scaler_login :authenticate
  attr_accessor :password_confirmation
end