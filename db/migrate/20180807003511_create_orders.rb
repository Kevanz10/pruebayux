class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.references :reservation, foreign_key: true
      t.float :minibar
      t.references :guest, foreign_key: true

      t.timestamps
    end
  end
end
