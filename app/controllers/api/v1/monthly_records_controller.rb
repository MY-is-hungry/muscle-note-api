class Api::V1::MonthlyRecordsController < ApplicationController
  
  def show
    monthly_record = DailyRecord.where(recorded_on: Time.current.all_month)
    return render json: { data: monthly_record }
  end

end
