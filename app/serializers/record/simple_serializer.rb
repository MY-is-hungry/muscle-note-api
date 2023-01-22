class Record::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :weight, :rep

  belongs_to :note, serializer: NoteSerializer
end
