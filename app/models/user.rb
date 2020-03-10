class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  def test_passage(test)
    test_passages.where(test_id: test.id).last
  end

  def passed_tests(level)
    tests.by_level(level)
  end
end
