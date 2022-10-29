class EventRecord < ApplicationRecord
  belongs_to :event
  belongs_to :note, optional: true, dependent: :destroy
  has_many :records

end
