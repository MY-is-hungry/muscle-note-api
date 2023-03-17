class Category < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 30 }
  validates :user_id, presence: true, length: { maximum: 48 }
end
