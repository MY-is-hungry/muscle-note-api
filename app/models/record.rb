class Record < ApplicationRecord

  def volume
    weight * rep
  end
end
