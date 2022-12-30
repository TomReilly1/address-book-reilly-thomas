require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save person without first name and last name" do
    person = Person.new
    assert_not person.save, "Saved the person without a first name or last name"
  end  
end
