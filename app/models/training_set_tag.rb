class TrainingSetTag < ApplicationRecord
  belongs_to :tag
  belongs_to :training_set
  belongs_to :note, dependent: :destroy

end
