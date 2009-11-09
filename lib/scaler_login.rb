require File.dirname(__FILE__) + "/scaler_login/models/authenticate"
require File.dirname(__FILE__) + "/scaler_login/models/base"

module ScalerLogin
  # Learned a lot from Devise
  
  # STRATEGIES  = [:rememberable, :authenticatable].freeze
  # TRUE_VALUES = [true, 1, '1', 't', 'T', 'true', 'TRUE'].freeze
  # 
  # # Maps the messages types that comes from warden to a flash type.
  # FLASH_MESSAGES = {
  #   :unauthenticated => :success,
  #   :unconfirmed => :failure
  # }
  # 
  # # Mappings
  # mattr_accessor :mappings
  # self.mappings = {}
  # 
  # class << self
  #   # Sets up a way to custom configure the setup in the Rails App
  #   def setup
  #     yield self
  #   end
  #   
  #   # def mail_sender=(value) #:nodoc:
  #   #   ScalerLoginMailer.sender = value
  #   # end
  #   # alias :sender= :mailer_sender=
  # 
  #   # Sets warden configuration using a block that will be invoked on warden
  #   # initialization.
  #   def warden(&block)
  #     @arden_config = block
  #   end
  #   
  #   # A method used internally to setup warden manager from the Rails initialize
  #   # block.
  #   def configure_warden_manager(manager) #:nodoc:
  #     # manager.default_strategies *ScalerLogin::STRATEGIES
  #     manager.failure_app = ScalerLogin::Failure
  #     manager.silence_missing_strategies!
  # 
  #     # If the user provided a warden hook, call it now.
  #     @warden_config.try :call, manager
  #   end

  #end # self class
end # ScalerLogin module

# require 'scaler_login/warden'
# require 'scaler_login/rails'