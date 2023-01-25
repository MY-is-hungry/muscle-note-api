class Record::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :weight, :rep, :start_at, :volume

  # belongs_to :note, serializer: NoteSerializer
end
