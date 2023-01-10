require "test_helper"

class EmailTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end

  test "should save Email with proper params" do
    # without comment
    email = Email.new(
      email_address: 1231231234,
      person_id: 1
    )
    assert email.save, "Did not save Email with proper params"
    
    # with comment
    email = Email.new(
      email_address: 9995554444,
      comment: "test comment",
      person_id: 2
    )
    assert email.save, "Did not save Email with proper params"
  end

  test "should not save Email without required params" do
    email = Email.new(
      email_address: nil,
      comment: "test_comment",
      person_id: 1
    )
    assert_not email.save

    email = Email.new(
      email_address: 1374958267,
      comment: "test_comment",
      person_id: nil
    )
    assert_not email.save
  end
  
end
