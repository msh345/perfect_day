class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :itinerary_spots
  has_many :spots, through: :itinerary_spots

  has_many :favorite_itineraries
  has_many :favorited_by, through: :favorite_itineraries, source: :user

  def upvote!
    self.vote_count += 1
    self.save
  end
end
