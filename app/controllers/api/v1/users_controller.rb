class Api::V1::UsersController < ApplicationController

  def show
    return render json: { msg: "success" }
  end

  def create
    raise 'アカウントの作成に失敗しました。もう一度お試しください。' if params[:user][:fb_uid].blank?
    user = User.find_or_create_by(user_params)
    return render json: { user: user }
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :fb_uid)
    end

end
