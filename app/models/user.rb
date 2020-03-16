class User < ApplicationRecord
  EMAIL_FORMAT = /\A\S+@\w+\.\w{2,6}\z/i

  has_many :created_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates :email, presence: true,
                    uniqueness: true,
                    format: EMAIL_FORMAT

  def test_passage(test)
    test_passages.where(test_id: test.id).last
  end

  def passed_tests(level)
    tests.by_level(level)
  end
end
