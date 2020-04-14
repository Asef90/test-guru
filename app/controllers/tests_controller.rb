class TestsController < ApplicationController

  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.any?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:danger] = t('.no_questions')
      redirect_to root_path
    end

  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
