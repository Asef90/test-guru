class Gist < ApplicationRecord

  belongs_to :user
  belongs_to :question

  def question_body
    question.body[0, 25]
  end

  def gist_hash
    gist_url.split('/').last
  end
end
