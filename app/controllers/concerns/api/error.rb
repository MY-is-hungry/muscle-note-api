module Api::Error

  # included do
  #   rescue_from StandardError do |e|
  #     message = Rails.env.production? ? "Unknown error occured." : e.message
  #     Rails.logger.error e.message
  #     Rails.logger.error e.backtrace
  #     render_error :unknown_error, message: message, status: 500
  #   end

  #   ErrorHandler.catchables.each do |err|
  #     rescue_from err do |e|
  #       render_error e.code, message: e.message, status: e.status
  #     end
  #   end

  #   rescue_from ActiveRecord::RecordInvalid do |e|
  #     Rails.logger.error e.message
  #     Rails.logger.error e.backtrace
  #     render_error :input_invalid, message: e.message, status: 400
  #   end

  #   rescue_from ActiveRecord::RecordNotFound do |e|
  #     render_error :not_found, message: e.message, status: 404
  #   end
  # end

  class Base < StandardError
    @status = nil
    @default_message = nil

    class << self
      attr_accessor :status
      attr_accessor :default_message
      def inherited( klass )
        klass.status = @status
        klass.default_message = @default_message
      end
      def code
        self.to_s.demodulize.underscore
      end
    end

    def initialize( message=nil )
      @message = message
    end

    def message
      @message.presence || self.class.default_message
    end

    def code
      self.class.code
    end

    def status
      self.class.status
    end

    def payload
      {
        code: code,
        message: message,
      }
    end
  end

  class BadRequest < Base
    @status = 400
  end
  class Unauthorized < Base
    @status = 401
  end
  class Forbidden < Base
    @status = 403
  end
  class NotFound < Base
    @status = 404
  end
  class InternalServerError < Base
    @status = 500
  end
  class ServiceUnavailable < Base
    @status = 503
  end

  class UknownError < InternalServerError; end
  class UnderMaintenance < ServiceUnavailable; end

  class TokenUnauthorized < Unauthorized; end
  class TokenExpired < Unauthorized; end
  class IpBlocked < Forbidden; end
  class AccessDenied < Forbidden; end

  class AuthenticationFailed < Unauthorized; end
  class AuthorizationViolated < Forbidden; end
  class InputInvalid < BadRequest; end
  class OperationIncompleted < BadRequest; end

  def self.catchables
    [
      Api::Error::NotFound,
      Api::Error::UknownError,
      Api::Error::UnderMaintenance,
      Api::Error::TokenUnauthorized,
      Api::Error::TokenExpired,
      Api::Error::IpBlocked,
      Api::Error::AuthenticationFailed,
      Api::Error::AuthorizationViolated,
      Api::Error::InputInvalid,
      Api::Error::OperationIncompleted,
    ]
  end

end
