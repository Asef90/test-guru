class CreateBadgeAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_awards do |t|
      t.references :user, null: false, foreign_key: false
      t.references :badge, null: false, foreign_key: false

      t.timestamps
    end
  end
end
