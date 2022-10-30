class EventRecord < ApplicationRecord
  belongs_to :event
  belongs_to :note, optional: true, dependent: :destroy
  has_many :records

  scope :total_date, -> { pluck(:recorded_at).map(&:beginning_of_day).uniq }

  # def total_volume
  #   sets.sum(:volume)
  # end

end
