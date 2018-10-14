class Client < ApplicationRecord
  validates :name, presence: true, length:{maximum:30}, allow_blank: false
  validates :age, presence: true, numericality:{only_integer: true}, length:{is: 2}, allow_blank: false
  validates :number, presence: true, numericality:{only_integer: true}, length:{maximum:10}
  validates :branch_id, presence: true, numericality:{only_integer: true}, allow_blank: false
  
  belongs_to :branch
  has_many :accounts
  has_many :loans
end