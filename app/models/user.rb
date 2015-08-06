class User < ActiveRecord::Base
  include TheRole::Api::User
  authenticates_with_sorcery!
  belongs_to :role
  has_attached_file :userpic, :styles => { :medium => "300x300>", :thumb => "75x75>" }, :default_url => "/images/users/userpic.png", :path => ":rails_root/app/assets/images/users/:id/:style/:filename", :url => ":rails_root/app/assets/images/users/:id/:style/:filename"
  validates_attachment_content_type :userpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    validates :password, confirmation: true,:length => { :within => 6..40 }, :on => :create
  validates :password_confirmation,:length => { :within => 6..40 }, presence: true
  validates :username, uniqueness: true
end