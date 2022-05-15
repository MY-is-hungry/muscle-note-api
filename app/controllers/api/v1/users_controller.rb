class Api::V1::UsersController < ApplicationController
  def hello
    return render json: {msg: "success"}
  end
end
