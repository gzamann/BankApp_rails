# frozen_string_literal: true

# Card table
class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_type
      t.integer :number
      t.integer :cvv
      t.integer :pass
      t.datetime :date_of_issue
      t.datetime :date_of_expiry

      t.references :account, index: true, foreign_key: true
      t.timestamps
    end
  end
end
