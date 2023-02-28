module Session
  include ActionController::HttpAuthentication::Token

  def logged_in?
    @current_user_id.present?
  end

  def set_current_user_id
    token, options = token_and_options(request)
    raise Api::Error::TokenUnauthorized if token.blank? || token == 'undefined'
    @current_user_id = token
  end

end