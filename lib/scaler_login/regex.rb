module ScalerLogin
  module Regex
    
    # Borrowed from Authlogic
    def self.email
      return @email_regex if @email_regex
      email_name_regex  = '[A-Z0-9_\.%\+\-]+'
      domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
      domain_tld_regex  = '(?:[A-Z]{2,4}|museum|travel)'
      @email_regex = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
    end
    
    def self.login
      /\A\w[\w\.+\-_@ ]+\z/
    end
    
  end # Regex
end # ScalerLogin