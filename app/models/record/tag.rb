class Record::Tag < ApplicationRecord
  belongs_to :record
  belongs_to :tag
end