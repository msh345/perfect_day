class Spot < ActiveRecord::Base
  has_many :itinerary_spots
  has_many :itineraries, through: :itinerary_spots
  has_and_belongs_to_many :spot_types

  def upvote!
    self.vote_count += 1
    self.save
  end
end
