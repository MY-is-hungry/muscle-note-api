class Record::DetailSerializer < ActiveModel::Serializer
  attributes :id, :start_at

  # belongs_to :note, serializer: NoteSerializer
end
