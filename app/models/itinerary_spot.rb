class ItinerarySpot < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :spot
end
