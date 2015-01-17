class QuestionsController < ApplicationController
  before_action :validate_user, except: [:index, :show]

  def index
    @questions = Question.search(params[:search])
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @tags = @question.get_question_tags
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    tag_names = params[:question].delete(:tag)
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
      @question.create_tags(tag_names)
    else
      render @question
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    if @question.save
      redirect_to question_path(@question.id)
    else
      render @question
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.destroy_all
    @question.destroy
    redirect_to root_path
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end
end
