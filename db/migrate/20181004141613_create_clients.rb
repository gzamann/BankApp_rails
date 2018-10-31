# frozen_string_literal: true

# client's table fields
class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age, :number
      t.string :email, :pan
      t.string :street, :city, :state, :pincode, :address
      t.date :dob

      t.references :branch, index: true, foreign_key: true
      t.timestamps
    end
  end
end
