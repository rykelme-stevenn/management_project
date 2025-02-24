class Address < ApplicationRecord
    has_one :store, dependent: :destroy

    validates :street, :city, :state, :postal_code, presence: true
    validates :postal_code, format: { with: /\A\d{5}-\d{3}\z/, message: "wrong format! The correct format is 00000-000" }
    validates :country, presence: true, default: "Brasil"
end