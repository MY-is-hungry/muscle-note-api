class Response
  class << self
    def success(object)
      return { json: object, status: 200 }
    end
  end
end