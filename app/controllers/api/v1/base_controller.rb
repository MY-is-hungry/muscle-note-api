class Api::V1::BaseController < ApplicationController
  include Session
  before_action :set_current_user_id

  def render_data( data, **args )
    status = args.delete(:status)
    render json: args.merge(data: data), status: (status.presence || 200)
  end
end