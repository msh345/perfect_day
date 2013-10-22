class CreateFavoriteItineraries < ActiveRecord::Migration
  def change
    create_table :favorite_itineraries do |t|
      t.references :user, index: true
      t.references :itinerary, index: true

      t.timestamps
    end
  end
end
