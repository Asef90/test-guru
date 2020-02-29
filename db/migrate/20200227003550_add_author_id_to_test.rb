class AddAuthorIdToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, index: true, foreign_key: { to_table: :users }
    change_column_null :tests, :author_id, false
  end
end
