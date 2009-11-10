module ScalerLogin
  module Models
    module Registrate
      # nodoc
      def self.included(klass)
        klass.class_eval do
          extend ClassMethods
        
          # Adds a password confirmation field
          attr_accessor :password_confirmation
        end
      end
      
      # nodoc
      module ClassMethods
      end      
      
    end # Registrate
  end # Models
end # ScalerLogin