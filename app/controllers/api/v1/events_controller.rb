class Api::V1::EventsController < Api::V1::BaseController
  def index
    events = Event.where(user_id: @current_user_id)
    render json: events, each_serializer: EventSerializer
  end
end
