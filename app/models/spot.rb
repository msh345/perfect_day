class Spot < ActiveRecord::Base
  has_many :itinerary_spots
  has_many :itineraries, through: :itinerary_spots

  def upvote!
    self.vote_count += 1
    self.save
  end

  def coords
    [self.latitude.to_f, self.longitude.to_f]
  end
end
