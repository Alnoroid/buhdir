class Event < ActiveRecord::Base
  has_many :event_curator_users
  scope :title_search, -> (search) { where('name LIKE ?', "%#{search}%")}
  scope :event_curator_users_filter, -> (curator) {joins(:event_curator_users).where(event_curator_users:{user_id:curator})}
  #scope :date_search, -> (date) {where("date_start BETWEEN '#{date}' AND '#{DateTime.now}'")}
  scope :date_search, -> (date) {where("date_start > ?",date)}
end