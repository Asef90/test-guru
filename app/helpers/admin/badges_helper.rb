module Admin::BadgesHelper
  def badge_header(badge)
    badge_title = badge.new_record? ? t('.create') : t('.edit')
  end

  def value_title(name, value)
    return Category.find_by(id: value).title if name == 'Category'
    value
  end
end
