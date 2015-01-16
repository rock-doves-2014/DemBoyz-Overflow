class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :status, :null => false
      t.references :answer, index: true

      t.timestamps
    end
  end
end
