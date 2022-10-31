class Api::V1::BaseController < ApplicationController
  include Api::Error
  include Session
  before_action :set_current_user_id

  rescue_from StandardError do |e|
    message = Rails.env.production? ? "Unknown error occured." : e.message
    Rails.logger.error e.message
    Rails.logger.error e.backtrace
    render_error :unknown_error, message: message, status: 500
  end
  Api::Error.catchables.each do |err|
    rescue_from err do |e|
      render_error e.code, message: e.message, status: e.status
    end
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    Rails.logger.error e.message
    Rails.logger.error e.backtrace
    render_error :input_invalid, message: e.message, status: 400
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error :not_found, message: e.message, status: 404
  end

  # def render_data( data, **args )
  #   status = args.delete(:status)
  #   render json: args.merge(data: data), status: (status.presence || 200)
  # end

  def render_error( code, status:, **args )
    render json: {success: false, code: code}.merge(args), status: status
  end
end