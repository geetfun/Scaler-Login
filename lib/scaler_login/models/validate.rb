module ScalerLogin
  module Models
    module Validate
      # nodoc
      def self.included(klass)
        klass.class_eval do
          before_validation :downcase_email!
          
          validates_presence_of :email, :password, :password_confirmation
          validates_uniqueness_of :email
          validates_format_of :email, :with => ::ScalerLogin::Regex.email
          validates_length_of :email, :in => 6..100
          validate :password_matches?
          
          include Validations
          include Utils
        end
      end
      
      # nodoc
      module Validations
        def password_matches?
          errors.add(:password_confirmation, "don't match") unless password == password_confirmation
        end        
      end
      
      module Utils
        def downcase_email!
          email.to_s.downcase!
        end
      end
      
    end # Registrate
  end # Models
end # ScalerLogin