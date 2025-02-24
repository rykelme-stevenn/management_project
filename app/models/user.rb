class User < ApplicationRecord
  has_secure_password

  belongs_to :store, optional: false

  validates :name, presence: true
  validates :cpf, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :role, presence: true
  validates :password_digest, presence: true

  attribute :role, default: 'seller'
end