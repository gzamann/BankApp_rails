class Transaction < ApplicationRecord
  validates :t_type, presence: true, length: {maximum: 1}, inclusion: { in: %w(W D)}
  validates :amount, presence: true, numericality:{only_integer:true}, length: {maximum: 12}
  
  belongs_to :account
  after_save :change_balance
  
  private
		
  def change_balance
      if self.t_type == "W"
          if self.amount < self.account.balance
            remaining_balance = self.account.balance - self.amount
            unless self.account.update_attributes(balance: remaining_balance)
              raise "Transaction Cancelled!"
            end
          end
      end

      if self.t_type == "D"
        new_balance = self.account.balance + self.amount
        unless self.account.update_attributes(balance: new_balance)
          raise "Transaction Cancelled!"
        end	
      end
  end

end