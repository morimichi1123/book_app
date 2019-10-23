50.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  publisher = Faker::Book.publisher
  genre = Faker::Book.genre
Book.create!(title: title,
             author: author,
             publisher: publisher,
             genre: genre,
             )
end

User.create!(name:  "morisaki",
           email: "morisaki@morisaki.com",
           password:              "hogehoge",
           password_confirmation: "hogehoge",
           admin: true)

5.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
             email: email,
             password:              password,
             password_confirmation: password)
end