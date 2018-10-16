# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :t_type, presence: true, length: { maximum: 1 }, inclusion: { in: %w[d w], message: 'must be d or w' }
  validates :amount, numericality: { greater_than: 0 }, length: { maximum: 6 }
  validates :account_id, numericality: { only_integer: true }
  validate  :check_withdraw

  belongs_to :account

  before_save :do_transaction

  private

  def check_withdraw
    errors.add(:amount, 'Not enough balance in account!') if t_type == 'w' && amount > account.balance
  end

  def do_transaction
    updated_balance = if t_type == 'w'
                        account.balance - amount
                      else
                        account.balance + amount
                      end
    account.update_attributes(balance: updated_balance)
  end
  # unless self.account.update_attributes(balance: updated_balance)
  #     raise "Transaction Cancelled!"
  # end
end
