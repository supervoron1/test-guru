# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
# categories = [:Ruby, :Rails, :JS, :HTML]
# categories.each { |c| Category.create(title: c) }

Test.delete_all
categories = Category.create([{title: :Ruby}, {title: :Rails}, {title: :JS}, {title: :HTML}])
tests = Test.create([{title: 'Ruby intermediate', level: 2, category_id: categories[0].id},
                     {title: 'Rails basics', level: 1, category_id: categories[1].id},
                     {title: 'JS basics', level: 1, category_id: categories[2].id},
                     {title: 'HTML advanced', level: 3, category_id: categories[3].id}
                     ])

Question.delete_all
question = Question.create([{body: "Ruby most famous framework?", test_id: tests[0].id},
                            {body: "What kind of software design pattern Rails uses?", test_id: tests[1].id}
                            ])

Answer.delete_all
Answer.create(body: 'Sinatra', correct: false, question_id: question[0].id)
Answer.create(body: 'Ruby on Rails', correct: true, question_id: question[0].id)
Answer.create(body: 'MVP', correct: false, question_id: question[1].id)
Answer.create(body: 'MVC', correct: true, question_id: question[1].id)

User.delete_all
3.times do |i|
  User.create(login: "user#{i}", email: "user#{i}@hooli.xyz")
end
User.create(login: 'admin', email: 'admin@gmail.com')

PassedTest.create(test_id: 4, user_id: 4)
PassedTest.create(test_id: 1, user_id: 4)
