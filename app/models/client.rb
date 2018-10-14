class Client < ApplicationRecord
  include Address_form, Address_validations

  validates :name, presence: true, length:{maximum:30}, allow_blank: false
  validates :age, numericality:{:greater_than=>15,:less_than=>100}, length:{is: 2}
  validates :number, numericality:{only_integer: true}, length:{maximum:10}
  validates :email, allow_nil: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :pan, allow_nil: true, length:{is:10}
  validates :branch_id, numericality:{only_integer: true}
  
  belongs_to :branch
  has_many :accounts
  has_many :loans

  after_initialize :form_address
end