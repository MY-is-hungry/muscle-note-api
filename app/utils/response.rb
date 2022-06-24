class Response
  class << self
    def success(object)
      return { json: { data: object }, status: 200 }
    end
  end
end