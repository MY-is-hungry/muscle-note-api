class Category::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id
  # has_many :events, serializer: EventSerializer
end
