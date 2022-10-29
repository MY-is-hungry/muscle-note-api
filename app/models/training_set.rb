class TrainingSet < ApplicationRecord
  belongs_to :record
  belongs_to :note, dependent: :destroy
  has_many :set_tags, class_name: 'TrainingSet::Tag'
  has_many :tags, through: :set_tags, source: :tag

end
