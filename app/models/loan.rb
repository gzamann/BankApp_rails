class Loan < ApplicationRecord
  validates :loan_type, presence: true, length: {maximum: 10}, inclusion: {in: %w(Home Personal Education Business)}, allow_blank: false
  validates :amount, presence: true,  numericality: {:greater_than=>1000}, length: {maximum: 8}
  validates :client_id, presence: true, numericality:{only_integer: true}
  validates :months, presence: true, numericality:{:greater_than=>0,:less_than=>121}
  validates :rate, presence: true, numericality: true, length:{maximum:4}

  belongs_to :client

  after_initialize :time_issue

  private

  def time_issue
    self.time_of_issue = Time.now
  end
end