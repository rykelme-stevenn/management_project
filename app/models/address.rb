class Address < ApplicationRecord
    has_one :store, dependent: :destroy

    validates :street, :city, :state, :postal_code, presence: true
    validates :country, presence: true
end