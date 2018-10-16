class Transaction < ApplicationRecord
  validates :t_type, presence: true, length: {maximum: 1}, inclusion:{in:%w(d w),message:"must be d or w"}
  validates :amount, numericality:{:greater_than=>0}, length: {maximum: 6}
  validates :account_id, numericality:{only_integer: true}
  validate  :check_withdraw
  
  belongs_to :account

  before_save :do_transaction
  
  private
  
  def check_withdraw
    if self.t_type == "w" && self.amount > self.account.balance
        errors.add(:amount, "Not enough balance in account!")
    end
  end

  def do_transaction
    if self.t_type == "w"
      updated_balance = self.account.balance - self.amount
    else
      updated_balance = self.account.balance + self.amount
    end
    self.account.update_attributes(balance: updated_balance)
  end
    # unless self.account.update_attributes(balance: updated_balance)
    #     raise "Transaction Cancelled!"
    # end
end