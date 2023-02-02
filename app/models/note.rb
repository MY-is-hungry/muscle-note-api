class Note < ApplicationRecord
  validates :user_id, :resource_id, presence: true
  validates :resource_kind, uniqueness: { scope: :resource_id }

  enum resource_kind: {
    exercise: "exercise",
    record: "record",
  }
end
