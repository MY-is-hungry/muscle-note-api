class Api::V1::MonthlyRecordsController < ApplicationController
  
  def show
    monthly_record = DailyRecord.where(recorded_on: Time.current.all_month).as_json(include: :event_records)
    return render Response.success(monthly_record)
  end

end
