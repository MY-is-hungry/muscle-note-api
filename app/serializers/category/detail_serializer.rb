class Category::DetailSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :events, serializer: EventSerializer
end
