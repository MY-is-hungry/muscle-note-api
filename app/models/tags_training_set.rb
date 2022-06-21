class TagsTrainingSet < ApplicationRecord
  belongs_to :tag
  belongs_to :training_set
end
