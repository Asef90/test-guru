class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def passed_tests(level)
    tests.where(level: level)
  end
end
