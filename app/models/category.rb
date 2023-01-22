class Category < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
