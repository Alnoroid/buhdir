class User < ActiveRecord::Base
  include TheRole::Api::User
  authenticates_with_sorcery!
  belongs_to :role
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :username, uniqueness: true
  mount_uploaders :userpic, AvatarUploader
  def userpic
    read_attribute(:userpic).presence || "users/userpic.png"
  end
end