class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :upVotes
  has_many :downVotes
  has_many :comments
end
