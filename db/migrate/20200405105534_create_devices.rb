class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :uuid
      t.integer :user_id

      t.timestamps
    end
  end
end
