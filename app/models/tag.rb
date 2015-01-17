class Tag < ActiveRecord::Base
  has_many :questions
  has_many :questions, through: :question_tags

  validates :title, presence: true

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
