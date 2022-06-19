class AuthenticationController < ApplicationController
  def create
    user = User.find_by_email(authentication_params[:email])

    if user&.authenticate(authentication_params[:password])
      token = issue_token(user)
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { error: 'Incorrect username or password.' }
    end
  end

  def show
    if logged_in?
      render json: current_user
    else
      render json: { error: 'User is not logged in/could not be found.' }
    end
  end

  private

  def authentication_params
    params.require(:authentication).permit(:email, :password)
  end
end
