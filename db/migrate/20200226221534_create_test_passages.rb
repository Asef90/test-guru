class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests, table_name: :test_passages do |t|
      t.index [:user_id, :test_id]
    end
  end
end
