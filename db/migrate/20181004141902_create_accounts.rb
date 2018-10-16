# frozen_string_literal: true

# Account table
class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.string :a_type
      t.integer :number

      t.references :client, index: true, foreign_key: true
      t.timestamps
    end
  end
end
