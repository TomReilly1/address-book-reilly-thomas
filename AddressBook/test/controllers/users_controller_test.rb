require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "the truth" do
    assert true
  end

  test "should get the url to register a new user" do
    get register_url
    assert_response(200)
  end

  test "should register a new user" do
    assert_difference("User.count") do
      post users_url, params: { 
        user: {
          username: "test_username",
          password: "test_password"
        }
      }
      assert_response(302)
      
      follow_redirect!
      assert_equal "/people", path
      assert_response(200)
    end
  end
  
end
