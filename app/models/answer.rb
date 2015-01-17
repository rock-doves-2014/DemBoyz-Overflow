class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  def calculate_up_votes
    @up_votes = Vote.where(status: true, answer_id: self.id)
    @up_votes.count
  end

  def self.calculate_down_votes(answer)
    @down_votes = Vote.where(status: false, answer_id: answer.id)
    @down_votes.count
  end
end
