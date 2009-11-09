require 'test/test_helper'

class AuthenticateTest < ActiveSupport::TestCase
  
  context "validating user" do
    setup do
      @user = Factory.create(:user)
    end
    subject { @user }
    
    should "return User instance if provided valid email and password" do
      assert_not_nil User.authenticate(:email => "user@test.com", :password => "secret123")
    end
  
    should "return nil if provided invalid email and password" do
      assert_nil User.authenticate(:email => "bogus@spam.com", :password => "bogus123")    
    end
  end # context
  
end