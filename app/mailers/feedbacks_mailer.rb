class FeedbacksMailer < ApplicationMailer

  def feedback(user, body)
    @body = body

    mail to: ENV['SMTP_USERNAME'], subject: "Feedback from #{user.email}"
  end

end
