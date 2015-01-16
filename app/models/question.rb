class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, through: :answers
end
