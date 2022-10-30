class Record < ApplicationRecord
  belongs_to :event_record
  belongs_to :note, dependent: :destroy
  has_many :record_tags, class_name: 'Record::Tag'
  has_many :tags, through: :record_tags, source: :tag, inverse_of: true

end