class Api::V1::ExercisesController < Api::V1::BaseController

  def with_records
    records = Record.where(user_id: @current_user_id, **selection_range)
    exercise_ids = records.pluck(:exercise_id).uniq
    exercises = Exercise.where(id: exercise_ids)
    render json: exercises, each_serializer: Exercise::RecordSerializer
  end

  private

    def selection_range
      time = params[:date].to_s ? Time.parse(params[:date]) : Time.current
      case params[:type]
      when 'monthly'
        { executed_on: time.beginning_of_month..time.end_of_month }
      when 'daily'
        { executed_on: time.beginning_of_day..time.end_of_day }
      else
        {}
      end
    end
end
