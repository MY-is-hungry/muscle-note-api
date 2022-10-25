class Api::V1::DailyRecordsController < Api::V1::BaseController

  def show
    daily_record = DailyRecord.find_by(recorded_on: params[:date]).as_json(include: { event_records: { include: [:training_sets, :event] } })
    return render Response.success(daily_record)
  end

end
