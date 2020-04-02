class Gist < ApplicationRecord

  belongs_to :user
  belongs_to :question

  def question_body
    question.body.truncate(25, omission: '')
  end

  def gist_hash
    gist_url.split('/').last
  end
end
