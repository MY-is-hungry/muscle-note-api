class Tag < ApplicationRecord
  has_many :record_tags, class_name: 'Record::Tag'
  has_many :records, through: :record_tags, source: :record, inverse_of: true

  validates :name, presence: true
end
