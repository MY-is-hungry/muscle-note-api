class Category < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy

  enum status: {
    inactive: 0,
    active:   1, #デフォルト値
  }

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 30 }
end
