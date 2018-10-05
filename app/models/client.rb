class Client < ApplicationRecord
  validates :name, presence: true, length:{maximum:30}
  validates :age, presence: true, numericality:{only_integer: true}, length:{is: 2}
  validates :number, presence: true, numericality:{only_integer: true}, length:{maximum:10}

  has_many :accounts
  has_many :loans
  has_many :cards
end