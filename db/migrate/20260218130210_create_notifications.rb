class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.float :latitude
      t.float :longitude
      t.float :radius_km

      t.timestamps
    end
  end
end
