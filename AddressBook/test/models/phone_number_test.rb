require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end

  test "should save PhoneNumber with proper params" do
    # without comment
    phone_number = PhoneNumber.new(
      phone_number: 1231231234,
      person_id: 1
    )
    assert phone_number.save, "Did not save PhoneNumber with proper params"
    
    # with comment
    phone_number = PhoneNumber.new(
      phone_number: 9995554444,
      comment: "test comment",
      person_id: 2
    )
    assert phone_number.save, "Did not save PhoneNumber with proper params"
  end

  test "should not save PhoneNumber without required params" do
    phone_number = PhoneNumber.new(
      phone_number: nil,
      comment: "test_comment",
      person_id: 1
    )
    assert_not phone_number.save

    phone_number = PhoneNumber.new(
      phone_number: 1374958267,
      comment: "test_comment",
      person_id: nil
    )
    assert_not phone_number.save
  end

end
