class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
