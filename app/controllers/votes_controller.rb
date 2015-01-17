class VotesController < ApplicationController
  before_action :validate_user, except: :show

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to question_path(id: params[:vote][:question_id])
    else
      redirect_to new_vote_path
    end
  end

private

    def vote_params
      params.require(:vote).permit(:status, :answer_id)
    end

end
