class FeedbacksController < ApplicationController
  def new
  end

  def create
    body = params[:feedback][:body]

    FeedbacksMailer.feedback(current_user, body).deliver_now if body.present?
    redirect_to root_path
  end
end
