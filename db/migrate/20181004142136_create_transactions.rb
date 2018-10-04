class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :t_type
      t.integer :amount

      t.references :account, index: true, foreign_key: true
      t.timestamps
    end
  end
end
