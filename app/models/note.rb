class Note < ApplicationRecord
  validates :user_id, :resource_id, :resource_kind, :content, presence: true
  validates :resource_kind, uniqueness: { scope: :resource_id }

  enum resource_kind: {
    exercise: "exercise",
    record: "record",
  }
end
