class Card < ApplicationRecord
  validates :card_type, presence: true, allow_blank: false, length: {maximum: 10}
  validates :number, presence: true, numericality:{only_integer: true}, length: {is: 10}
  validates :account_id, presence: true, numericality:{only_integer: true}
  
  belongs_to :account
end