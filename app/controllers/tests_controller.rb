class TestsController < ApplicationController
  before_action :find_test, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "Test not found"
  end
end
