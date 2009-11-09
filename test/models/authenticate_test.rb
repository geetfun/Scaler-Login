require 'test/test_helper'

class AuthenticateTest < ActiveSupport::TestCase
  
  context "class object" do
    should "have 'authenticate' class method" do
      assert User.respond_to? :authenticate
    end
  end
  
  context "instance object" do
    setup do
      @user = User.new
    end
    subject { @user }
    
    should "have a :password_confirmation field" do
      assert @user.respond_to? :password_confirmation=
    end
  end
  
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
  
end # AuthenticateTest