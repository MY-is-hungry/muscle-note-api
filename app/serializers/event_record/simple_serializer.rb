class EventRecord::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :recorded_at

  has_many :records, serializer: Record::SimpleSerializer
end
