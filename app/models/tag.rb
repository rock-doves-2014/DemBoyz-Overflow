class Tag < ActiveRecord::Base
  validates :title, presence: true

  has_many :question_tags
  has_many :questions, through: :question_tags

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
