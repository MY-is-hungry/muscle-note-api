class Api::V1::RecordsController < Api::V1::BaseController

  def monthly
    monthly_record = Record.where(recorded_on: Time.current.all_month).as_json(include: :event_record)
    return render Response.success(monthly_record)
  end

  def daily
    daily_record = Record.find_by(recorded_on: params[:date]).as_json(include: { event_records: { include: [:training_sets, :event] } })
    return render Response.success(daily_record)
  end

end
