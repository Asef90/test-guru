class CreateTestPassagesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :test_passages, if_exists: true

    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, default: 0
    end
  end

  def down
    drop_table :test_passages
  end
end
