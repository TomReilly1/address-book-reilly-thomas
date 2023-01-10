require "test_helper"

class UserTest < ActiveSupport::TestCase  
  test "the truth" do
    assert true
  end

  test "should save User with proper params" do
    test_user = User.new(
      username: "test_username",
      password: "test_password"
    )

    assert test_user.save
  end

  test "should not save User without password" do
    test_user = User.new(
      username: "test_username",
      password: nil
    )
    
    assert_not test_user.save
  end

  test "should not save User without username" do
    test_user = User.new(
      username: nil,
      password: "test_password"
    )

    assert_not test_user.save
  end

  test "should not create a User with a username that already exists" do
    test_user = User.new(
      username: "username_one",
      password: "test_password"
    )

    assert_not test_user.save, "Saved user with a duplicate username"
  end

end
