class Record < ApplicationRecord
  belongs_to :event_record
  has_many :training_sets
  belongs_to :note, optional: true, dependent: :destroy

end
