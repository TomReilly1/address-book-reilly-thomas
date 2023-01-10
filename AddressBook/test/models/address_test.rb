require "test_helper"

class AddressTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "should save Address with proper params" do
    # without state
    address = Address.new(
      street:"test_street",
      town:"test_town",
      zip:12345,
      country:"test_country",
      person_id: 1
    )
    assert address.save, "Did not save Address with proper params"
    
    # with state
    address = Address.new(
      street:"test_street",
      town:"test_town",
      zip:12345,
      state:"test_state",
      country:"test_country",
      person_id: 2
    )
    assert address.save, "Did not save Address with proper params"
  end

  test "should not save Address without required params" do
    address = Address.new(
      street: nil,
      town: "test_town",
      state: "test_state",
      zip: 12345,
      country: "test_country",
      person_id: 1
    )
    assert_not address.save

    address = Address.new(
      street: "test_street",
      town: nil,
      state: "test_state",
      zip: 12345,
      country: "test_country",
      person_id: 1
    )
    assert_not address.save

    address = Address.new(
      street: "test_street",
      town: "test_town",
      state: "test_state",
      zip: nil,
      country: "test_country",
      person_id: 1
    )
    assert_not address.save

    address = Address.new(
      street: "test_street",
      town: "test_town",
      state: "test_state",
      zip: 12345,
      country: nil,
      person_id: 1
    )
    assert_not address.save

    address = Address.new(
      street: "test_street",
      town: "test_town",
      state: "test_state",
      zip: 12345,
      country: "test_country",
      person_id: nil
    )
    assert_not address.save
  end

end
