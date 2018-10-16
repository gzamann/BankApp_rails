# frozen_string_literal: true

class Branch < ApplicationRecord
  include AddressForm
  include AddressValidations

  validates :ifsc, presence: true, length: { maximum: 12 }, allow_blank: false
  validates :number, numericality: { only_integer: true }, length: { maximum: 10 }

  has_many  :clients

  before_create :form_address
end
