class Exercise < ApplicationRecord
  belongs_to :category
  has_many :records

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }

end
