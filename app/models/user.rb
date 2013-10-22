class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      # user.??               = auth.info.image
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end

    # r = open("http://graph.facebook.com/#{@user.facebook_id}/picture")
    #   image_data = r.read
    #   file_size = r.length
    #   mime_type = "image/jpeg"


  end
end
