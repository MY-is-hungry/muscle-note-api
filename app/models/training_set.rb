class TrainingSet < ApplicationRecord
  belongs_to :record
  has_many :training_set_tags, class_name: 'TrainingSet::Tag'
  has_many :tags, through: :set_tags, source: :tag
end
