class RemoveQuestionIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :question_id, :integer
  end
end
