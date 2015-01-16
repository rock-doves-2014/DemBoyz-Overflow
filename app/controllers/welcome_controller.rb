class WelcomeController < ApplicationController
  before_action :validate_user, except: [:index, :login]

  def index
  end

  def login
    @user = User.find_by_email(params[:welcome][:email]).try(:authenticate, params[:welcome][:password])
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
