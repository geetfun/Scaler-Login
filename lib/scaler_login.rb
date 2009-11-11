# ScalerLogin
require File.dirname(__FILE__) + "/scaler_login/version"      # ScalerLogin Version
require File.dirname(__FILE__) + "/scaler_login/cryptography" # Cryptography tools
require File.dirname(__FILE__) + "/scaler_login/regex"        # Regex patterns  
require File.dirname(__FILE__) + "/scaler_login/models/base"  # ScalerLogin Strategies
require File.dirname(__FILE__) + "/scaler_login/warden"       # Warden Framework
require File.dirname(__FILE__) + "/scaler_login/rails"        # Rails Plugin

module ScalerLogin
  # Learned a lot from Devise
  
  # STRATEGIES  = [:rememberable, :authenticatable].freeze
  TRUE_VALUES = [true, 1, '1', 't', 'T', 'true', 'TRUE'].freeze
  
  # # Maps the messages types that comes from warden to a flash type.
  # FLASH_MESSAGES = {
  #   :unauthenticated => :success,
  #   :unconfirmed => :failure
  # }
  # 

  # Mappings
  mattr_accessor :mappings
  self.mappings = {}
  
  mattr_accessor :pepper, :stretches, :remember_for, :confirm_within
  
  # Sets which current app we're scoping to for session data
  # This is for the purpose of single sign on
  mattr_accessor :current_app

  class << self
    # For setup in Rails' initializers scaler_login.rb
    def setup
      yield self
    end
    
    # Sets warden configuration using a block that will be invoked on warden
    # initialization.
    #
    #  Devise.initialize do |config|
    #    config.confirm_within = 2.days
    #
    #    config.warden do |manager|
    #      # Configure warden to use other strategies, like oauth.
    #      manager.oauth(:twitter)
    #    end
    #  end
    def warden(&block)
      @warden_config = block
    end
    
    # A method used internally to setup warden manager from the Rails initialize
    # block.
    def configure_warden_manager(manager) #:nodoc:
      # manager.default_strategies *ScalerLogin::STRATEGIES
      manager.failure_app = ::ScalerLogin::Failure
      # manager.silence_missing_strategies!

      # If the user provided a warden hook, call it now.
      @warden_config.try :call, manager
    end
  end # self class methods
end # ScalerLogin module