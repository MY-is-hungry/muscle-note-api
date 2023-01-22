class Category::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_id
end
