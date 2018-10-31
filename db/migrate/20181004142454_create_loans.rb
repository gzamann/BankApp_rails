# frozen_string_literal: true

# Loan table
class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.string :loan_type
      t.integer :amount
      t.integer :months
      t.float :rate
      t.datetime :time_of_issue
      t.datetime :end_of_loan

      t.references :client, index: true, foreign_key: true
      t.timestamps
    end
  end
end
