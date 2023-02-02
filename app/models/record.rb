class Record < ApplicationRecord
  belongs_to :exercise

  validates :user_id, presence: true

  def volume
    (weight && rep) ? weight * rep : 0
  end

  def is_blank_set?
    weight.blank? && rep.blank?
  end

end
