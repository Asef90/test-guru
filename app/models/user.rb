class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :questions, through: :gists

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.where(test_id: test.id).last
  end

  def passed_tests(level)
    tests.by_level(level)
  end
end
