module Setable
  extend ActiveSupport::Concern

  class_methods do
    def table_name_prefix
      'training_set_'
    end
  end
end
