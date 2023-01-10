require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
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

  test "should get new address url" do
    assert_equal "/people/1/addresses/new", new_person_address_path(@one.id)

    get new_person_address_path(@one.id)
    assert_equal 200, status
  end

  test "should create new address" do
    assert_difference("Address.count") do
      post person_addresses_url(@one.id), params: {
        address: {
          street:"test_street",
          town:"test_town",
          state:"test_state",
          zip:12345,
          country:"test_country",
          comment:"test comment",
          person_id: @one.id
        }
      }
    end
  
    assert_redirected_to person_path(@one.id)
  end
end
