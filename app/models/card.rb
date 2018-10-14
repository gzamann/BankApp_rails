class Card < ApplicationRecord
  validates :card_type, presence: true, allow_blank: false, length: {maximum: 10}
  validates :number, presence: true, numericality:{only_integer: true}, length: {maximum: 10}, allow_blank: false
  validates :account_id, presence: true, numericality:{only_integer: true}, allow_blank: false
  
  belongs_to :account
end