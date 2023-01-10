require "test_helper"

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
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

  test "should get new phone number url" do
    assert_equal "/people/1/phone_numbers/new", new_person_phone_number_path(@one.id)

    get new_person_phone_number_path(@one.id)
    assert_equal 200, status
  end

  test "should create new phone number" do
    assert_difference("PhoneNumber.count") do
      post person_phone_numbers_url(@one.id), params: {
        phone_number: {
          phone_number: 123456789,
          comment: "test comment",
          person_id: 1
        }
      }
    end
  
    assert_redirected_to person_path(@one.id)
  end
end
