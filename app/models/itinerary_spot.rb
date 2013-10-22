class ItinerarySpot < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :spot

  def upvote!
    self.vote_count += 1
    self.save
  end
end
