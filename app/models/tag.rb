class Tag < ActiveRecord::Base
  has_many :questions
  has_many :questions, through: :question_tags

  validates :title, presence: true

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def get_tag_questions
    questions = []
    tqs = QuestionTag.where(tag_id: self.id)
    tqs.map { |tq| questions << Question.find(tq.question_id) }
    questions
  end

end
