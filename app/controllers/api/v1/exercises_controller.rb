class Api::V1::ExercisesController < Api::V1::BaseController

  # TODO: 全体的に強引に値を作っているため、要リファクタリング
  def with_records
    @date = params[:date].to_s ? Date.parse(params[:date]) : Date.today
    records = selection_range_records
    exercise_ids = records.pluck(:exercise_id).uniq
    @exercises = Exercise.where(id: exercise_ids)
    sort_json = sort_record(exercises_json)
    render json: sort_json
  end

  private

    def exercises_json
      ActiveModelSerializers::SerializableResource.new(
        @exercises, each_serializer: Exercise::RecordSerializer, date: @date, date_type: params[:type], adapter: :json
      ).serializable_hash
    end

    def sort_record(json)
      json[:exercises].sort_by{ |ex| ex[:records].first["created_at"] }
    end

    def selection_range_records
      case params[:type]
      when 'monthly'
        Record.monthly_where(@date, @current_user_id)
      when 'daily'
        Record.daily_where(@date, @current_user_id)
      else
        {}
      end
    end
end
