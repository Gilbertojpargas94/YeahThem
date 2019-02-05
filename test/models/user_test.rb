require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "It should not create a user" do
    assert_not users(:two).save
  end

  test "It should create a user" do
    assert users(:one).save
  end

  test "it should not allow invalid emails" do
    assert_not User.new(email: "bad@email,com", first_name: "name", last_name: "last name").save
  end
end
