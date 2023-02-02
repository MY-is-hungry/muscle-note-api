class Record::DetailSerializer < ActiveModel::Serializer
  attributes :id, :weight, :rep, :executed_on, :volume, :days_count

  # belongs_to :note, serializer: NoteSerializer
end
