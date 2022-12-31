class Person < ApplicationRecord
    has_many :addresses
    has_many :emails
    has_many :phone_numbers

    validates :first_name, presence: true
    validates :last_name, presence: true
end
