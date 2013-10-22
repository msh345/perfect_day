class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
