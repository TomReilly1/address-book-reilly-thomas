require "test_helper"

class PersonTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end
  
  test "should save Person with required params" do
    person = Person.new(
      first_name: "test_first",
      last_name: "test_last",
    )
    assert person.save

    person = Person.new(
      salutation: "test_salutation",
      first_name: "test_first",
      middle_name: "test_middle",
      last_name: "test_last",
      ssn: 123456789,
      comment: "test_comment"
    )
    assert person.save
  end

  test "should not save Person with required params" do
    person = Person.new(
      salutation: "test_salutation",
      first_name: nil,
      middle_name: "test_middle",
      last_name: "test_last",
      ssn: 123456789,
      comment: "test_comment"
    )
    assert_not person.save

    person = Person.new(
      salutation: "test_salutation",
      first_name: "test_first",
      middle_name: "test_middle",
      last_name: nil,
      ssn: 123456789,
      comment: "test_comment"
    )
    assert_not person.save
  end

end
