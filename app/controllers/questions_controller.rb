class QuestionsController < ApplicationController
  before_action :find_all_questions, only: %i[index create]
  before_action :find_question, only: %i[show delete]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @questions.map { |q| q.body }
    render plain: result.join("\n")
  end

  def show
    render plain: @question.body
  end

  def create
    question = @questions.create(question_params)
    render plain: question.body
  end

  def new

  end

  def delete
    @question.destroy
    render plain: "Question deleted"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_all_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end

end
