class Card < ApplicationRecord
  validates :card_type, presence: true, length: {maximum: 10}
  validates :number, presence: true,length: {maximum: 10}
  
  belongs_to :account
end