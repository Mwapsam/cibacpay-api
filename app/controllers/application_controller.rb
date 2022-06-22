class ApplicationController < ActionController::API
  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    exp = 15.minutes.from_now.to_i
    payload = { user_id: user.id, exp: exp }
    JWT.encode(payload, jwt_key, 'HS256')
  end

  def decoded_token
    JWT.decode(token, jwt_key, true, { algorithm: 'HS256' })
  rescue StandardError
    [{ error: 'Invalid Token' }]
  end

  def token
    request.headers['Authorization']
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end
end
