class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :number
      t.float :daily_rates

      t.timestamps
    end
  end
end
