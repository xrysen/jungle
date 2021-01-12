class SessionsController < ApplicationController
  def new
  end

  # def create
  #   puts User.myTest
  #   user = User.find_by_email(params[:email])
  #   #if user exists and password is entered correctly
  #   if user && user.authenticate(params[:password])
  #     #Save user id inside the broswer cookie
  #     session[:user_id] = user.id
  #     redirect_to "/"
  #   else
  #     # If user login doesn't work
  #     redirect_to '/login'
  #   end
  # end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
