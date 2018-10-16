# frozen_string_literal: true

class Account < ApplicationRecord
  validates :balance, length: { maximum: 12 }, numericality: { greater_than_or_equal_to: 0 }
  validates :a_type, presence: true, length: { maximum: 8 }, inclusion: { in: %w[Saving Current NRI FD] }
  validates :number, length: { maximum: 12 }, numericality: { only_integer: true }, allow_blank: false
  validates :client_id, numericality: { only_integer: true }

  belongs_to :client
  has_many :transactions
  has_many :cards
end
