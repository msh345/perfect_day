class CreateSpotTypes < ActiveRecord::Migration
  def change
    create_table :spot_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :spot_types_spots do |t|
      t.references :spot,      index: true
      t.references :spot_type, index: true
    end
  end
end
