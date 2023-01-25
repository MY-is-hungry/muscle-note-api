class Exercise::RecordSerializer < ExerciseSerializer
  has_many :order_records, serializer: Record::SimpleSerializer, key: :records
end
