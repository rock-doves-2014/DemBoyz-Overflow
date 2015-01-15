class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :upVotes Can we make these polymorphic?
  has_many :downVotes
  has_many :comments
end
