class Branch < ApplicationRecord
  include Address_form, Address_validations

  validates :ifsc, presence: true, length: {maximum: 12}, allow_blank: false
  validates :number, numericality:{only_integer: true}, length: {maximum: 10}

  has_many  :clients

  before_create :form_address
end