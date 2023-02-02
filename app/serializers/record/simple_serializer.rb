class Record::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :weight, :rep, :executed_on, :volume

  # belongs_to :note, serializer: NoteSerializer
end
