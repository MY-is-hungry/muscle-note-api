class User < ApplicationRecord
  has_one :option, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :daily_records, dependent: :destroy
  has_many :tags, dependent: :destroy
end
