class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :itinerary_spots
  has_many :spots, through: :itinerary_spots

  def upvote!
    self.vote_count += 1
    self.save
  end
end
