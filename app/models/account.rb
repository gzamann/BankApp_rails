class Account < ApplicationRecord
  validates :balance, presence: true, length: {maximum: 12}, numericality: true
  validates :a_type, presence: true, length: {maximum: 10}, inclusion: { in: %w(Saving Current NRI FD)}
  validates :number, presence: true, numericality:{only_integer:true}, length: {maximum: 10}
  validate  :balance_valid

  belongs_to :client
  has_many :transactions

  private

  def balance_valid
    if self.balance < 0
      errors.add(:balance, "Account balance is too low.")
    end
  end 

end