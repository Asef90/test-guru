class Answer < ApplicationRecord
  MAX_ANSWERS_NUMBER = 4
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_number

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    errors.add(:question, 'may contain 1-4 answers') if question.answers.size >= MAX_ANSWERS_NUMBER
  end
end
