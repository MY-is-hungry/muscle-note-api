class Record < ApplicationRecord
  belongs_to :event
  belongs_to :daily_record
  has_many :training_sets
end
