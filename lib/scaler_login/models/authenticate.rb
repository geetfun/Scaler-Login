module ScalerLogin
  module Models
    # nodoc
    module Authenticate
      def self.included(base)
        base.class_eval do
          extend ClassMethods
        end
      end
    
      module ClassMethods
        # Authenticates a user based on email and password
        # Returns:
        # - authenticated user if valid
        # - nil if NOT valid
        # Attributes :email and :password
        def authenticate(attributes={})
          result = find_by_email(attributes[:email])
        end
      end
    
    end # Authenticate
  end # Models
end # ScalerLogin