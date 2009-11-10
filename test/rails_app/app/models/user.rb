class User < ActiveRecord::Base
  scaler_login :authenticate, :registrate, :validate
end