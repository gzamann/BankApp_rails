class Card < ApplicationRecord
  validates :card_type, presence: true, allow_blank: false, length: {maximum: 10}
  validates :number, numericality:{only_integer: true}, length: {is: 12}
  validates :cvv, numericality:{only_integer: true}, length:{is:3}
  validates :pass, numericality:{only_integer: true}, length:{is:4}
  validates :account_id, numericality:{only_integer: true}

  belongs_to :account

  after_initialize :validity

  def validity
    self.date_of_issue = Time.now
    self.date_of_expiry = self.date_of_issue + 5.years
  end
end