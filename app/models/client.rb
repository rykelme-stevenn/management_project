class Client < ApplicationRecord
    belongs_to :address, optional: true
    belongs_to :work_address, class_name: 'Address', optional: true
    belongs_to :franchise, optional: false
  
    validates :name, presence: true
    validates :cpf, presence: true
    validates :birth_date, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :tel_main, presence: true
  end
  