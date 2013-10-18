class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates :email, format: {with: /\S{2,}@\S{2,}\.\S{2,}/}
end
