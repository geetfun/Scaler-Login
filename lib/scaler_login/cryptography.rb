require 'bcrypt'

module ScalerLogin
  # Here we use BCrypt, mainly because we're trying to be as secure as possible
  # so SHA just doesn't cut it for us.
  module Cryptography
    class Random
      # Generates a random hexadecimal string
      # The final length is 2 * length
      def self.generate_token(length=20)
        ::ActiveSupport::SecureRandom.hex(length)
      end
    end
    
    class BCrypt
      
      class << self
        def cost
          @cost = 5
        end
        
        def salt
          ::ScalerLogin::Cryptography::Random.generate_token
        end
        
        def encrypt(password, salt, cost)
          
        end
      end
    end
  end # Cryptography
end # ScalerLogin