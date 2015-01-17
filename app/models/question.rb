class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags

  def create_tags(tags)
    tags[:title].split(',').each do |tag|
      self.tags.create(title: tag.strip)
    end
  end

  validates :title, presence: true

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def get_question_tags
    tags = []
    qts = QuestionTag.where(question_id: self.id)

    qts.each do |qt|
      tags << Tag.find(qt.tag_id)
    end

    tags
  end

end
