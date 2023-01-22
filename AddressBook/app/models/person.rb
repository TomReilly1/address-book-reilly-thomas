class Person < ApplicationRecord
    has_many :addresses
    has_many :emails
    has_many :phone_numbers

    belongs_to :user

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :user, presence: true
end
