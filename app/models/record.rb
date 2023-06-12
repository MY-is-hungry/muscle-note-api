class Record < ApplicationRecord
  belongs_to :exercise

  validates :executed_on, presence: true

  scope :daily_where, -> (date, user_id) { where(user_id: user_id, executed_on: date) }
  scope :monthly_where, -> (date, user_id) { where(user_id: user_id, executed_on: date.all_month) }

  def volume
    (weight && rep) ? weight * rep : 0
  end

  def is_blank_set?
    weight.blank? && rep.blank?
  end

end
