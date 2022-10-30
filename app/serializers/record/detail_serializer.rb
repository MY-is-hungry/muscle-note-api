class Record::DetailSerializer < ActiveModel::Serializer
  attributes :id, :recorded_at

  belongs_to :note, serializer: NoteSerializer
end
