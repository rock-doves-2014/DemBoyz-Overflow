class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  def self.calculate_up_votes(answer)
    @up_votes = Vote.where(status: true, answer_id: answer.id)
    @up_votes.count
  end

  def self.calculate_down_votes(answer)
    @down_votes = Vote.where(status: false, answer_id: answer.id)
    @down_votes.count
  end
end
