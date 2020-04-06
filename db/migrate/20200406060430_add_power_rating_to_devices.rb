class AddPowerRatingToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :power_rating, :integer
  end
end
