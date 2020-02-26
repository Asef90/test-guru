# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CATEGORY_RANGE = (1..5).freeze
TQA_RANGE = (1..3).freeze

category, test, question = [0, 0, 0]
num_a, num_q, num_t = [0, 0, 0]

CATEGORY_RANGE.each do |i|
  num_c = i
  category = Category.create(title: "Category #{num_c}")

  TQA_RANGE.each do
    num_t += 1
    test = Test.create(title: "Test #{num_t}", level: (num_t % 3 + 1), category_id: category.id)

    TQA_RANGE.each do
      num_q += 1
      question = Question.create(body: "Question #{num_q}", test_id: test.id)

      TQA_RANGE.each do
        num_a += 1
        Answer.create(body: "Answer #{num_a}", correct: (num_a % 3).zero?, question_id: question.id)
      end
    end
  end
end

(1..5).each { |i| User.create(name: "User #{i}", age: (i + 10)) }
