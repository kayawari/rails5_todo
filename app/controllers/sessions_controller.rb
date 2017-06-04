include ApplicationHelper

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    # メアドとパスワード認証
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
