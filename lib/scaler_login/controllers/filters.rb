module ScalerLogin
  module Controllers
    module Filters
      
      def self.included(klass)
        klass.class_eval do
          helper_method :warden
          
          def authenticate_user!
            # request.env['warden'] = "current_app"
            warden.authenticate!(:scope => :user)
          end
        end
      end
      
      # The main accessor for the warden proxy instance
      def warden
        request.env['warden']
      end
      
      # ::ScalerLogin.mappings.each_key do |mapping|
      #   class_eval <<-EOF, __FILE__, __LINE__
      #     def authenticate_#{mapping}!
      #       request.env['warden']['shit'] = current_app
      #       warden.authenticate!(:scope => :#{mapping})
      #     end
      #     
      #     def #{mapping}_signed_in?
      #       
      #     end
      #     
      #     def current_#{mapping}
      #       
      #     end
      #     
      #     def #{mapping}_session
      #       
      #     end
      #   EOF
      # end
      
    end # Filters
  end # Controllers
end # ScalerLogin