class Api::V1::EventRecordsController < Api::V1::BaseController

  def daily
    records = EventRecord.includes(:records, :event).where(recorded_at: Time.parse(params[:date]).all_day)
    render json: records, each_serializer: EventRecord::DetailSerializer
  end

  def monthly
    records = EventRecord.includes(:records).where(recorded_at: Time.current.all_month)
    render json: records, each_serializer: EventRecord::SimpleSerializer
  end

end
