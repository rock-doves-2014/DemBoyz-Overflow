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
end
