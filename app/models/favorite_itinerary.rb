class FavoriteItinerary < ActiveRecord::Base
  belongs_to :user
  belongs_to :itinerary
end
