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

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end