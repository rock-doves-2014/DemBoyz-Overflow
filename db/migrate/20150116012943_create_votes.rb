class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :status
      t.references :answer

      t.timestamps
    end
  end
end
