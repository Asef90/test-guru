class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :gists
  belongs_to :test

  validates :body, presence: true

  def correct_answers
    answers.correct.count
  end
end
