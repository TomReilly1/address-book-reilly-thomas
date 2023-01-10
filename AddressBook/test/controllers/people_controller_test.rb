require "test_helper"

# sign in as user, "one", as defined in users.yml fixture
def sign_in()
  post login_url, params:  {
    username: "username_one",
    password: "password_one"
  }
end

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should redirect to login without authorization" do
    get people_url
    assert_response :redirect
  end

  test "should login and redirect" do
    get login_url
    assert_equal 200, status

    post login_url, params:  {
      username: "username_one",
      password: "password_one"
    }

    follow_redirect!
    assert_equal 200, status
    assert_equal "/people", path
  end

  test "should show people index" do
    sign_in

    get people_url
    assert_response :success
  end
  
  test "should create person" do
    sign_in

    assert_difference("Person.count") do
      post people_url, params: {
        person: {
          salutation: "test_salutation",
          first_name:"test_first_name",
          middle_name:"test_middle_name",
          last_name:"test_last_name",
          ssn:123456789,
          comment:"test_comment"
        }
      }
    end
  
    assert_redirected_to person_path(Person.last)
  end
  
end
