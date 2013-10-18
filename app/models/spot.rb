class Spot < ActiveRecord::Base
  has_many :itinerary_spots
  has_many :itineraries, through: :itinerary_spots
end
