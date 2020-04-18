class TestPassage < ApplicationRecord
  SUCCESS_RESULT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question, if: -> { current_question }


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def result
    correct_questions * 100.0 / test.questions.count
  end

  def success?
    result >= SUCCESS_RESULT
  end

  def question_num
    return test.questions.ids.index(current_question.id) + 1 if test.questions.any?
    0
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_ids.sort.map(&:to_s) == answer_ids.to_a.sort
  end

  def correct_answers_ids
    current_question.answers.correct.ids
  end

  def next_question
    test.questions.where('id > ?', current_question.id).first
  end

  def set_next_question
    self.current_question = next_question
  end
end
