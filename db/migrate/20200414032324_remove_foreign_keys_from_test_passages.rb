class RemoveForeignKeysFromTestPassages < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :test_passages, :questions, column: :current_question_id
    remove_foreign_key :test_passages, :tests
  end
end
