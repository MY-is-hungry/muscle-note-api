class Exercise < ApplicationRecord
  belongs_to :category
  has_many :records
  # has_many :order_records, -> { order(created_at: :desc) }, class_name: 'Record'

  enum status: {
    inactive: 0,
    active:   1, #デフォルト値
  }

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 50 }

end
