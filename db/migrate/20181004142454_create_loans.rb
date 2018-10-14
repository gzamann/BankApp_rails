class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.string :loan_type
      t.integer :amount
      t.string :time_of_issue
      t.integer :months
      t.integer :rate
      
      t.references :client, index: true, foreign_key: true
      t.timestamps
    end
  end
end
