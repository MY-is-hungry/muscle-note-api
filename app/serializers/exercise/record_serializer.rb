class Exercise::RecordSerializer < ExerciseSerializer
  attributes :id
  attributes :name
  attributes :category_id
  # has_many :order_records, serializer: Record::SimpleSerializer, key: :records
  attributes :records

  # TODO: 強引に返り値を作っているため、要リファクタリング
  def records
    date, date_type = @instance_options[:date], @instance_options[:date_type]
    return [] if date.blank? || date_type.blank?
    records = Record.where(**selection_range(date, date_type))
    records.map { { **_1.attributes, volume: _1.volume } }
  end

  private
    def selection_range(date, type)
      case type
      when 'monthly'
        { executed_on: date.beginning_of_month..date.end_of_month, exercise_id: object.id }
      when 'daily'
        { executed_on: date, exercise_id: object.id }
      else
        {}
      end
    end
end
