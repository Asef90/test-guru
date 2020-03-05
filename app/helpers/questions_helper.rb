module QuestionsHelper

  def question_header
    "#{action_name.capitalize} #{@question.test.title} Question"
  end
end
