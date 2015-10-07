class ContactType < ActiveRecord::Base
  belongs_to :contact_category
  has_many :contacts
end