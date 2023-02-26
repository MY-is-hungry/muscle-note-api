class Exercise < ApplicationRecord
  belongs_to :category
  has_many :records
  # has_many :order_records, -> { order(created_at: :desc) }, class_name: 'Record'

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 50 }
  validates :user_id, presence: true, length: { maximum: 48 }

end
