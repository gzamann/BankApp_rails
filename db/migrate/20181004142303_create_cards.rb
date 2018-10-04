class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_type
      t.integer :number

      t.references :client, index: true, foreign_key: true
      t.timestamps
    end
  end
end
