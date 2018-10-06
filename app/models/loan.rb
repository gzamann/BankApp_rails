class Loan < ApplicationRecord
  validates :loan_type, presence: true, length: {maximum: 10}, inclusion: {in: %w(Home Personal Education Business)}
  validates :amount, presence: true,  numericality: {only_integer: true}, length: {maximum: 12}
  
  belongs_to :client
end