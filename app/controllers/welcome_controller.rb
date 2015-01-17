class WelcomeController < ApplicationController
  before_action :validate_user, except: [:index, :login, :logout]

  def index
    @questions = Question.includes(:user).order('created_at DESC').limit(5)
    @tags = Tag.limit(30)
    @last_user = User.last
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
