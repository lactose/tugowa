require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  @attr = {
    :name => "Example User",
    :email => "user@example.com"
  }

  test "should not save user without email" do
    User.new(@attr.merge(:email => ""))
    assert false
  end

  test "should not save user with invalid email" do
    User.new(@attr.merge(:email => "sdfaf"))
    assert false
  end

end
