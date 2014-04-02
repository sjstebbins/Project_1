class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if session[:return_to]
        return_path = session[:return_to]
        session[:return_to] = nil
        redirect_to return_path
      else
      redirect_to @user
      end
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
