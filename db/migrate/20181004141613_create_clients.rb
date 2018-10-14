class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.integer :number
      t.string :email

      t.references :branch, index: true, foreign_key: true
      t.timestamps
    end
  end
end
