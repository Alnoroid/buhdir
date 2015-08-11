class ContactType < ActiveRecord::Base
  belongs_to :contact_category
end