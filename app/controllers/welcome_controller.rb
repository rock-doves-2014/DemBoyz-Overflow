class WelcomeController < ApplicationController

  def index
  end

  def login
    @user = User.find(params[:id]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

end
