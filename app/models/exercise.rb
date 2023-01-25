class Exercise < ApplicationRecord
  belongs_to :category
  has_many :records
  has_many :order_records, -> { order(created_at: :desc) }, class_name: 'Record'

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }

end
