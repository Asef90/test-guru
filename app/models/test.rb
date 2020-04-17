class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(category) { includes(:category).where(categories: { title: category }) }
  scope :with_questions, -> { joins(:questions).
                              group("tests.id HAVING count(questions.id) > 0").order(:created_at) }

  def self.titles_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
