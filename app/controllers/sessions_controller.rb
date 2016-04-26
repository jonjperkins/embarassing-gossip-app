class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
      redirect_to login_path
      flash[:success] = "You're logged in!"
    else 
      flash[:danger] = "Invalid email/password combination"
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
    flash[:success] = "You're logged out!"
  end
  
end
