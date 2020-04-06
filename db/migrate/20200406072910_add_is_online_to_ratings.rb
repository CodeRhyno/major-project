class AddIsOnlineToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :is_online, :boolean, defualt: false
  end
end
