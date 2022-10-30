class Record::SimpleSerializer < ActiveModel::Serializer
  attributes :id, :weight, :reps, :volume

  belongs_to :note, serializer: NoteSerializer
end
