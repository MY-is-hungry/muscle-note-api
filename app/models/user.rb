class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :records, dependent: :destroy

  enum status: {
    inactive: 0, #デフォルト値
    active:   1
  }
  enum authentication_type: {
    anonymous: 0,
    email:     1,
    apple:     2,
    google:    3,
  }
end
