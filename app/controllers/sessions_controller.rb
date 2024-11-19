class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      flash[:success] = "ログインしました。"
      redirect_to user
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_path, status: :see_other
  end
end
