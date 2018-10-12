class Card < ApplicationRecord
  validates :card_type, presence: true, allow_blank: false, length: {maximum: 10}
  validates :number, presence: true,length: {maximum: 10}, allow_blank: false
  
  belongs_to :account
end