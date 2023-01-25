class Record < ApplicationRecord
  belongs_to :exercise

  validates :user_id, presence: true

  def volume
    weight * rep
  end

end
