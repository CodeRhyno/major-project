class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :device_id
      t.integer :power_consumption

      t.timestamps
    end
  end
end
