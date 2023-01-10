require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  test "the truth" do
    assert true
  end

  test "should sign in registered user" do
    post login_url, params:  {
      username: "username_one",
      password: "password_one"
    }

    follow_redirect!
    assert_equal 200, status
    assert_equal "/people", path
  end

  test "should refuse incorrect username or password" do
    post login_url, params:  {
      username: "username_one_wrong",
      password: "password_one"
    }
    assert_response :redirect
    assert_equal "/login", path

    post login_url, params:  {
      username: "username_one",
      password: "password_one_wrong"
    }
    assert_response :redirect
    assert_equal "/login", path
  end

  test "should log a user out of a session" do
    post login_url, params:  {
      username: "username_one",
      password: "password_one"
    }
    
    assert_equal 1, session[:user_id]
    
    get logout_url
    assert_equal "/logout", path
    assert_response :redirect

    follow_redirect!
    assert_equal "/login", path
    assert_nil session[:user_id]
  end
end
