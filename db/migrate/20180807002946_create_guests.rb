class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :social_security
      t.integer :loyalty_membership

      t.timestamps
    end
  end
end
