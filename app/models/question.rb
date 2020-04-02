class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :gists
  has_many :users, through: :gists
  belongs_to :test

  validates :body, presence: true
end
