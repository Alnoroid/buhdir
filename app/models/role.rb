class Role < ActiveRecord::Base
  include TheRole::Api::Role
  has_many :users
end