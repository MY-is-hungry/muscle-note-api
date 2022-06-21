class Tag < ApplicationRecord
  belongs_to :user
  has_many :tags_training_sets
  has_many :training_sets, through: :tags_training_sets
end
