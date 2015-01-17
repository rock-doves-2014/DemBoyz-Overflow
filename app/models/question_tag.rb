class QuestionTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :question

    def get_question_tags
      tags = []
      qts = QuestionTag.where(question_id: self.id)

        qts.each do |qt|
          tags << Tag.find(qt.tag_id)
        end
      tags
    end
end
