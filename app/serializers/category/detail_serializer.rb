class Category::DetailSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :exercises, serializer: ExerciseSerializer
end
