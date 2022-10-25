class Set::Tag < ApplicationRecord
  include Setable
  belongs_to :set
  belongs_to :tag, class_name: '::Tag'
end