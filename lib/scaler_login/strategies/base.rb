module ScalerLogin
  module Strategies
    # Base strategy for ScalerLogin. Responsible for verifying correct scope and
    # mapping.
    class Base < Warden::Strategies::Base

      # Validate strategy. By default will raise an error if no scope or an
      # invalid mapping is found.
      def valid?
        mapping.for.include?(self.class.name.split("::").last.underscore.to_sym)
      end

      # Checks if a valid scope was given for devise and find mapping based on
      # this scope.
      def mapping
        @mapping ||= begin
          raise "You need to give a scope for ScalerLogin authentication" unless scope
          raise "You need to give a valid ScalerLogin mapping"            unless mapping = ScalerLogin.mappings[scope]          
          mapping
        end
      end
    end
  end
end
