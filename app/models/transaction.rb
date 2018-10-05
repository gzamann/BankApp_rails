class Transaction < ApplicationRecord
  validates :t_type, presence: true, length: {maximum: 1}, inclusion: { in: %w(w d)}
  validates :amount, presence: true, numericality:{only_integer:true}, length: {maximum: 12}
  validate  :check_withdraw
  
  belongs_to :account
  after_initialize :do_transaction
  
  private
  
  def check_withdraw
    if self.t_type = "w"
      if self.amount > self.account.balance
        errors.add(:amount, "Not enough balance in account!")
      end
    end
  end
  
  def do_transaction
      if self.t_type == "w"
        updated_balance = self.account.balance - self.amount
      else
        updated_balance = self.account.balance + self.amount
      end

      unless self.account.update_attributes(balance: updated_balance)
        raise "Transaction Cancelled!"
      end
  end
end