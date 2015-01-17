class UsersController < ApplicationController
  before_action :validate_user, except: [:new, :create]

  def new
    unless current_user
    @user = User.new
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(created_at: :desc).limit(10)
    @answers = @user.answers.order(created_at: :desc).limit(10)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
