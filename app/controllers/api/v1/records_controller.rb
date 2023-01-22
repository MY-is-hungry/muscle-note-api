class Api::V1::RecordsController < Api::V1::BaseController

  def index
    records = Record.where(user_id: @current_user_id, **selection_range)
    render json: { data: records, each_serializer: Record::DetailSerializer, volume: records.sum{ _1.volume }, days_count: records.size }
  end

  private

    def selection_range
      cur_time = Time.current
      case params[:type]
      when 'monthly'
        { start_at: cur_time.beginning_of_month..cur_time.end_of_month }
      when 'daily'
        { start_at: cur_time.beginning_of_day..cur_time.end_of_day }
      else
        {}
      end
    end
end
