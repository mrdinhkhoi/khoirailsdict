User.create!(name:  "KOH",
             email: "mrdinhkhoi@gmail.com",
             password:              "kochodau",
             password_confirmation: "kochodau",
             admin: true)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

30.times do |n|
  title = Faker::Name.title
  description = Faker::Lorem.paragraphs
  keyword = Faker::Lorem.word
  Newpost.create!(title: title,
                  description: description,
                  keyword: keyword)
end


