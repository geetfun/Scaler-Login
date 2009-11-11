module ScalerLogin
  module Strategies
    class Authenticate < ::ScalerLogin::Strategies::Base
      
      def authenticate!
        
      end
      
    end # Authenticate
  end # Strategies
end # ScalerLogin

Warden::Strategies.add(:authenticate, ScalerLogin::Strategies::Authenticate)