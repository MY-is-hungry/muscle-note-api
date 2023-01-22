class Note < ApplicationRecord
  validates :name, :user_id, presence :true

  enum resource_kind: {
    exercise: "exercise",
    record: "record",
  }
end
