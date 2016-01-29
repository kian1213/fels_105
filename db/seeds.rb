# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_image file_name
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

User.create!(
  first_name: "Lorem",
  last_name: "Ipsum",
  email: "admin@example.com",
  password: "admin123",
  password_confirmation: "admin123",
  avatar: seed_image("default.jpg"),
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
puts "Done creating default user"


3.times do
  Category.create(
    name: Faker::Name.title,
    description: Faker::Lorem.paragraph,
    picture: seed_image("category.jpg")
  )
end
puts "Done creating categories"

50.times do |word|
  Word.create(
    category_id: Category.first.id,
    content: Faker::Lorem.word
  )
end
puts "Done creating words"

word_id = 1
answers = []
while word_id < 51
  3.times do
    list = {
        word_id: Word.find(word_id).id,
        content: Faker::Lorem.word,
        correct: false
    }
    answers << list.to_h
  end
  correct = {
    word_id: Word.find(word_id).id,
    content: Faker::Lorem.word,
    correct: true
  }
  answers << correct.to_h
  word_id += 1
end

answers.each do |answer|
  Answer.create(
    word_id: answer[:word_id],
    content: answer[:content],
    correct: answer[:correct]
  )
end
puts "Done creating answers"