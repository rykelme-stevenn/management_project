class Franchise < ApplicationRecord
    has_many :users
    
    validates :name, presence: true
    validates :cnpj, presence: true, uniqueness: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "wrong format! The correct format is 00.000.000/0000-00" }
    validates :slug, presence: true, uniqueness: true
    validates :active, inclusion: { in: [true, false] } 
end