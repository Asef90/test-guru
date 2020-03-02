class AddEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    change_column_null :users, :email, false
  end
end
