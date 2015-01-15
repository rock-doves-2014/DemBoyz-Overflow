class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :upVotes
  has_many :downVotes
  has_many :comments
end
