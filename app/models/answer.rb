class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  def calculate_up_votes
    @up_votes = Vote.where(status: true, answer_id: self.id)
    @up_votes.count
  end

  def calculate_down_votes
    @down_votes = Vote.where(status: false, answer_id: self.id)
    @down_votes.count
  end
end
