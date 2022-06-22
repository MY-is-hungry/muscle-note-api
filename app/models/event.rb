class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :event_records
end
