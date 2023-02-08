class Record < ApplicationRecord
  belongs_to :exercise

  validates :executed_on, presence: true
  validates :user_id, presence: true, length: { maximum: 48 }

  def volume
    (weight && rep) ? weight * rep : 0
  end

  def is_blank_set?
    weight.blank? && rep.blank?
  end

end
