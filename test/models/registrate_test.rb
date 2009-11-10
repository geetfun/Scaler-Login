require 'test/test_helper'

class RegistrateTest < ActiveSupport::TestCase

  context "instance object" do
    setup do
      @user = User.new
    end
    subject { @user }

    should "have a :password_confirmation field" do
      assert @user.respond_to? :password_confirmation=
    end    
  end
  
end # RegistrateTest