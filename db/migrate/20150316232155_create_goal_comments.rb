class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.text :content, null: false
      t.integer :author_id, null: false, index: true
      t.integer :goal_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
