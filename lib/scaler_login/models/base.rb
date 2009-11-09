module ScalerLogin
  module Models
    module Base
      
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def scaler_login(*modules)
          # Turns all modules to :module1, :module2
          options = modules.extract_options!

          modules -= Array(options.delete(:except))

          modules.each do |m|
            login_modules << m.to_sym
            include ::ScalerLogin::Models::const_get(m.to_s.classify)
          end

          # Convert new keys to methods which overwrites Devise defaults
          options.each { |key, value| send(:"#{key}=", value) }      
        end

        def login_modules
          @login_modules ||= []
        end
      end
      
    end # Base
  end # Models
end # ScalerLogin

::ActiveRecord::Base.send :include, ::ScalerLogin::Models::Base