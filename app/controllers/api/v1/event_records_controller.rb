class Api::V1::EventRecordsController < Api::V1::BaseController
  # def daily
  #   daily_record = Record.find_by(recorded_at: params[:date]).as_json(include: { event_records: { include: [:training_sets, :event] } })
  #   return render Response.success(daily_record)
  # end
  def monthly
    records = EventRecord.includes(:records).where(recorded_at: Time.current.all_month)
    render json: records, each_serializer: EventRecordSerializer
  end
end
