class CreateAuroras < ActiveRecord::Migration[7.1]
  def change
    create_table :auroras do |t|
      t.string :session_token
      t.float :latitude
      t.float :longitude
      t.float :kp_index
      t.text :description
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
