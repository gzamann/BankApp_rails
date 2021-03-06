# frozen_string_literal: true

class Loan < ApplicationRecord
  validates :loan_type, presence: true, length: { maximum: 10 }, inclusion: { in: %w[Home Personal Education Business] }
  validates :amount, numericality: { greater_than: 1000, less_than: 1_000_000 }
  validates :months, numericality: { greater_than: 0, less_than: 121 }, allow_blank: false
  validates :rate, numericality: true, length: { maximum: 4 }
  validates :client_id, numericality: { only_integer: true }

  belongs_to :client

  before_create :time_issue

  private

  def time_issue
    self.time_of_issue = Time.now
    self.end_of_loan = time_of_issue + months.months
  end
end
