class Record::DetailSerializer < ActiveModel::Serializer
  attributes :id, :weight, :rep, :start_at, :volume, :days_count

  # belongs_to :note, serializer: NoteSerializer
end
