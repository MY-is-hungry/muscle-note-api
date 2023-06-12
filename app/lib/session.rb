module Session
  include ActionController::HttpAuthentication::Token

  def authenticate
    token, _options = token_and_options(request)
    payload = decode!(token)
    set_current_user(payload["user_id"])
    raise Api::Error::AuthenticationFailed, 'Please login.' unless logged_in?
  end

  def set_current_user(user_id = nil)
    @current_user ||= User.find_by(uid: user_id)
  end

  def logged_in?
    @current_user.present?
  end
end