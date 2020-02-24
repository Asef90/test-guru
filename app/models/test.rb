class Test < ApplicationRecord
  belongs_to :category

  def self.category(category)
    categories = Category.where(title: category).pluck(:id)
    self.where(category_id: categories).pluck(:title).sort.reverse
  end
end
