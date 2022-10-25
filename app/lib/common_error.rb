module CommonError

  class << self
    def rescue_list
      [
        ActiveRecord::RecordInvalid,
        ActiveRecord::RecordNotFound,
        ActiveRecord::StaleObjectError,
        ::CommonError::UnauthorizedCustomer,
        ::CommonError::UnauthorizedStaff,
        ::CommonError::TokenUnauthorized,
        ::CommonError::TokenExpired,
        ::CommonError::NotFound,
        ::CommonError::PartyNotFound,
      ]
    end
  end

  class BadRequest < BaseError
    def initialize(message)
      super(message, 400)
    end
    # @status = 400
  end
  class Unauthorized < BaseError
    def initialize(message)
      super(message, 401)
    end
    # @status = 401
  end
  class Forbidden < BaseError
    def initialize(message)
      super(message, 403)
    end
    # @status = 403
  end
  class NotFound < BaseError
    def initialize(message)
      super(message, 404)
    end
    # @status = 404
  end
  class InternalServerError < BaseError
    def initialize(message)
      super(message, 500)
    end
    @status = 500
  end
  class ServiceUnavailable < BaseError
    def initialize(message)
      super(message, 503)
    end
    # @status = 503
  end

  class UnauthorizedStaff < Unauthorized
    def initialize(message = nil)
      super("この操作にはログインが必要です。ログインしてください.")
    end
  end

  class UnauthorizedCustomer < Unauthorized
    def initialize(message = nil)
      super("この操作にはログインが必要です。ログインしてください.")
    end
  end

  # class UnknownError < InternalServerError; end
  # class UnderMaintenance < ServiceUnavailable; end

  class TokenUnauthorized < BadRequest; end
  class TokenExpired < BadRequest; end
  # class IpBlocked < Forbidden; end
  class PartyNotFound < NotFound; end

end