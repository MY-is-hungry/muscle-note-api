class Api::V1::DailyRecordsController < ApplicationController

  def show
    daily_record = DailyRecord.find_by(recorded_on: params[:date]).as_json(include: { event_records: { include: [:training_sets, :event] } })
    return render Response.success(daily_record)
  end

end
