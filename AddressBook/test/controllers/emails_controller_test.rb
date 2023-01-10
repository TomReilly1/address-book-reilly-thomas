require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @one = people :one
    post login_url, params:  {
      username: "username_one",
      password: "password_one"
    }
  end
  
  test "the truth" do
    assert true
  end

  test "should get new email url" do
    assert_equal "/people/1/emails/new", new_person_email_path(@one.id)

    get new_person_email_path(@one.id)
    assert_equal 200, status
  end

  test "should create new email" do
    assert_difference("Email.count") do
      post person_emails_url(@one.id), params: {
        email: {
          email_address:"test_email_address",
          comment:"test comment",
          person_id: @one.id
        }
      }
    end
  
    assert_redirected_to person_path(@one.id)
  end
end
