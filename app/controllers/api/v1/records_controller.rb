class Api::V1::RecordsController < Api::V1::BaseController

  def index
    records = Record.where(user_id: @current_user_id, **selection_range)
    render json: { data: records, each_serializer: Record::DetailSerializer, volume: records.sum{ _1.volume }, days_count: records.size }
  end

  def create
    sets = params[:records].presence || []

    ApplicationRecord.transaction do
      sets.each do |set|
        @record = Record.new(record_params(set))
        next if @record.is_blank_set?
        @record.save!

        note = Note.new(note_params(set))
        note.save! if note.content.present?
      end
    end
    render status: 200
  end

  private

    def selection_range
      cur_time = Time.current
      case params[:type]
      when 'monthly'
        { executed_on: cur_time.beginning_of_month..cur_time.end_of_month }
      when 'daily'
        { executed_on: cur_time }
      else
        {}
      end
    end

    def record_params(set)
      set.permit(:weight, :rep).merge(exercise_id: params[:exercise_id], user_id: @current_user_id, executed_on: params[:date])
    end

    def note_params(set)
      set.require(:note).permit(:content).merge(resource_kind: :record, resource_id: @record.id, user_id: @current_user_id)
    end
end
