class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :token
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
