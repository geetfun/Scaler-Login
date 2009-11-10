require 'test/test_helper'

class ValidateTest < ActiveSupport::TestCase
  context "a new user" do
    setup do
      @user = User.new(
        :email => "user@test.com",
        :password => "secret123",
        :password_confirmation => "secret123"
        )
    end
    subject { @user }

    should "validate presence of :email" do
      @user.email = nil
      assert !@user.valid?
      assert @user.errors.on(:email)
    end
    
    should "validate presence of :password" do
      @user.password = nil
      assert !@user.valid?
      assert @user.errors.on(:password)
    end
    
    should "validate presence of :password_confirmation" do
      @user.password_confirmation = nil
      assert !@user.valid?
      assert @user.errors.on(:password_confirmation)
    end
    
    should "not be valid when :password, :password_confirmation do not match" do
      @user.password_confirmation = "123secret"
      assert !@user.valid?
      assert @user.errors.on(:password_confirmation)
    end
    
    should "not be valid if invalid :email format" do
      @user.email = "aaaaaaaaaaaaa"
      assert !@user.valid?
      assert @user.errors.on(:email)
    end
    
    should "not be valid if :email is too short" do
      @user.email = "a@a.a"
      assert !@user.valid?
      assert @user.errors.on(:email)  
    end

    should "have a unique value for :email" do
      @user.email = "president@company.com"
      @user.save!
      
      @new_user = User.new(:email => "president@company.com", :password => "123secret", :password_confirmation => "123secret")
      assert !@new_user.valid?
      assert @new_user.errors.on(:email)

      @new_user = User.new(:email => "PRESIDENT@company.com", :password => "123secret", :password_confirmation => "123secret")
      assert !@new_user.valid?
      assert @new_user.errors.on(:email)
    end

  end
end # ValidateTest