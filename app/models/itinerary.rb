class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :itinerary_spots
  has_many :spots, through: :itinerary_spots

  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user

  # def upvote!
  #   self.vote_count += 1
  #   self.save
  # end
end
