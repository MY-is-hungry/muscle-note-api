class TrainingSet < ApplicationRecord
  belongs_to :event_record
  has_many :tags_training_sets
  has_many :tags, through: :tags_training_sets
end
