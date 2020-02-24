# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..5).each { |i| Category.create(title: "Category #{i}") }

(0..14).each { |i| Test.create(title: "Test #{i + 1}", level: (i % 3 + 1), category_id: (i / 3 + 1)) }

(0..44).each { |i| Question.create(body: "Question #{i + 1}", test_id: (i / 3 + 1)) }

(0..134).each { |i| Answer.create(body: "Answer #{i + 1}", correct: (i % 3 == 0), question_id: (i / 3 + 1)) }

(1..5).each { |i| User.create(name: "User #{i}", age: (i + 10)) }
