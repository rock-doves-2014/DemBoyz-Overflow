class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title, :uniqueness => true, :limit => 20
      t.references :question

      t.timestamps
    end
  end
end
