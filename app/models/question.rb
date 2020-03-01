class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validates :questions, on: :update

  private

  def validate_answers_number
    errors.add(:question, 'may contain 1-4 answers') unless answers.size.between?(1, 4)
  end
end
