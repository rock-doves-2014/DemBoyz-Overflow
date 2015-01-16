class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question_id = params[:question_id]
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      render @answer
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@answer.question.id)
  end

  def edit
    @answer = Answer.find(params[:id])
    @question_id = params[:question_id]
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)

    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      render @answer
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end