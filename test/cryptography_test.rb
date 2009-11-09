require 'test/test_helper'

class CryptographyTest < ActiveSupport::TestCase
  context "Random" do
    should "return a random hexadecimal string" do
      token = ::ScalerLogin::Cryptography::Random.generate_token(20)
      assert_not_nil token
      assert_equal token.length, 20*2
    end
  end
  
  context "BCrypt" do
    should "return a default cost of 5" do
      assert_equal ::ScalerLogin::Cryptography::BCrypt.cost, 5
    end
  end
  
end # CryptographyTest