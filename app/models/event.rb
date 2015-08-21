class Event < ActiveRecord::Base
  has_many :event_curator_users
  scope :titlesearch, -> (search) { where('name LIKE ?', "%#{search}%")}
  scope :in_work, -> { where(condition: 'В РАБОТЕ') }
end