class Loan < ApplicationRecord
  validates :loan_type, presence: true, length: {maximum: 10}, inclusion: {in: %w(Home Personal Education Business)}, allow_blank: false
  validates :amount, presence: true,  numericality: {:greater_than=>1000}, length: {maximum: 8}
  validates :client_id, presence: true, numericality:{only_integer: true}
  
  belongs_to :client
end