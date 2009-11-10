require 'test/test_helper'

class AuthenticateTest < ActiveSupport::TestCase
  
  context "class object" do
    should "have 'authenticate' class method" do
      assert User.respond_to? :authenticate
    end
  end
  
  context "validating user" do
    setup do
      @user = Factory.create(:user) if User.all.length == 0
    end
    subject { @user }
    
    should "return User instance if provided valid email and password" do
      assert_not_nil User.authenticate(:email => "user@test.com", :password => "secret123")
    end
  
    should "return nil if provided invalid email and password" do
      assert_nil User.authenticate(:email => "bogus@spam.com", :password => "bogus123")    
    end
  end
  
end # AuthenticateTest