class Record::Tag < ApplicationRecord
  belongs_to :record
  belongs_to :tag, class_name: '::Tag'
  belongs_to :note, dependent: :destroy

end