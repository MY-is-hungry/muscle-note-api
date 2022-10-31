class EventRecord::DetailSerializer < ActiveModel::Serializer
  attributes :id, :recorded_at

  belongs_to :event, serializer: EventSerializer
  has_many :records, serializer: Record::SimpleSerializer
end
