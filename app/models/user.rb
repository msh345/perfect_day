class User < ActiveRecord::Base
  has_many :itineraries
  has_many :favorites
  has_many :favorite_itineraries, through: :favorites, source: :itinerary


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.locale           = auth.extra.raw_info.locale
      user.location         = auth.info.location
      user.profile_url      = auth.info.image
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def has_favorited?(itinerary)
    !!Favorite.where(user_id: self.id, itinerary_id: itinerary.id).first
  end

end
