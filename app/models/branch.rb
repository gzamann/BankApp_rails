class Branch < ApplicationRecord
  validates :ifsc, presence: true, length: {maximum: 12}, allow_blank: false
  validates :address, presence: true, length: {maximum: 30}, allow_blank: false
  validates :number, presence: true, numericality:{only_integer: true}, length: {maximum: 10}

  has_many  :clients
end