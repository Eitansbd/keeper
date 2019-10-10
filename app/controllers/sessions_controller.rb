class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      #use flash.now instead of flash when using with render and not redirect
      flash.now[:danger] = "Invalid email/password combination" 
      render 'new'
    end
  end
  
  def delete
    log_out if logged_in?
    redirect_to root_url
  end


end
