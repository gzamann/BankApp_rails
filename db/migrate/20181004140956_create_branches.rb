# frozen_string_literal: true

# Branch's table fields
class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :ifsc
      t.integer :number
      t.string :street, :city, :state, :pincode, :address

      t.timestamps
    end
  end
end
