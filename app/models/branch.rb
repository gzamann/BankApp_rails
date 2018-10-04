class Branch < ApplicationRecord
  validates :IFSC, presence: true, length: {maximum: 12}
  validates :address, presence: true, length: {maximum: 30}
  validates :number, presence: true, numericality:{only_integer: true}, length: {maximum: 10}

  has_many  :users
end