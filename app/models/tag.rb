class Tag < ActiveRecord::Base
  belongs_to :question

  validates :title, presence: true

  def self.search(query)
    where("title like ?", "%#{query}%") 
  end

end