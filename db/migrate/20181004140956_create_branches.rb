class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :ifsc
      t.integer :number
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.string :address

      t.timestamps
    end
  end
end
