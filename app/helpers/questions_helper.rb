module QuestionsHelper

  def question_header(question)
    action_title = action_name == 'new' ? "Create new" : "Edit"
    "#{action_title} #{question.test.title} question"
  end
end
