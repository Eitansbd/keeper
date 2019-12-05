class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      flash[:success] = "Welcome Back!"
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination" 
      render 'new'
    end
  end
  
  def demo_login
    user = User.find_by(name: "Example User")
    log_in(user)
    flash[:success] = "You were logged in as 'Example User' for a demo." +
    "In the navigation click Account > Profile to visit your personal page. Enjoy!"
    redirect_to root_url
  end
  
  def delete
    log_out if logged_in?
    redirect_to root_url
  end


end
