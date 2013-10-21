class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name, null: false
      t.integer :vote_count, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
