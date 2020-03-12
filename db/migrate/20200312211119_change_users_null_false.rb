class ChangeUsersNullFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :age, true
  end
end
