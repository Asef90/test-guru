class Badge < ApplicationRecord
  RULE_NAMES = %i[attempt category level]

  validates :title, presence: true
  validates :image, presence: true
  validates :rule_name, presence: true

  has_many :badge_awards
  has_many :users, through: :badge_awards

  scope :category_badges, -> { where(rule_name: 'Category') }
  scope :level_badges, -> { where(rule_name: 'Level') }

  def self.by_category(category)
    category_badges.find_by(rule_value: category.id)
  end

  def self.by_level(level)
    level_badges.find_by(rule_value: level)
  end

  def self.all_levels
    level_badges.pluck(:rule_value).uniq
  end

  def self.attempt_badge
    find_by(rule_name: 'Attempt')
  end

end
