class TrainingSetSerializer < ActiveModel::Serializer
  attributes :id, :weight, :reps, :volume
end
