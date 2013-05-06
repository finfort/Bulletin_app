namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_advertisements
    make_comments
  end
end

def make_users
  admin = User.create!(username:     "test",
                       login:       "test",
                       full_name: "EXAMPLEovich",
                       email:    "example@example.org",
                       password: "test",
                       password_confirmation: "test",
                       birthday: "12.12.1255",
                       address: "Universitetskaya 35",
                       city: "Donetsk",
                       state: "Donetsk",
                       country: "Ukraine",
                       zip: "83000")

  admin.add_role :admin

  moderator = User.create!(username:     "moderator",
                       full_name: "I am moderator",
                       email:    "example@moderator.org",
                       password: "test",
                       password_confirmation: "test",
                       birthday: "12.12.1255",
                       address: "Ilicha 35",
                       city: "Donetsk",
                       state: "Donetsk",
                       country: "Ukraine",
                       zip: "83000")

  moderator.add_role :moderator

  user = User.create!(username:     "user",
                       full_name: "Developer",
                       email:    "example@developer.org",
                       password: "test",
                       password_confirmation: "test",
                       birthday: "12.12.1255",
                       address: "pr Mira 35",
                       city: "Donetsk",
                       state: "Donetsk",
                       country: "Ukraine",
                       zip: "83000")

  user.add_role :user


   9.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.email
    password  = "test"
    User.create!(username:     name,
                 full_name: Faker::Name.last_name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 birthday: "12.12.1990",
                 address: Faker::Address.street_name,
                 city: Faker::Address.city,
                 state:  Faker::Address.state,
                 country: Faker::Address.country,
                 zip: Faker::Address.zip_code
                )
  end
end

def make_advertisements
  users = User.all(limit: 15)
  10.times do
    #adv_img = Dir.glob(Rails.root.join("app", "assets", "images", "*")).sample
    #adv_img = Dir.glob(File.join("assets/images", "*")).sample
   users.each { |user|
      adv_img =""# File.basename(Dir.glob("public/public/*").sample)
      content = Faker::Lorem.sentence(27)
      user.advertisements.create!(content: content, img: adv_img)
    }
  end
end
def make_comments
  advertisement = Advertisement.all(limit:30)
  6.times do
  advertisement.each { |adv|
    author_name = Faker::Name.name
    site_url= Faker::Internet.url
    content = Faker::Lorem.sentence(5)
    adv.comments.create!(author_name: author_name, site_url: site_url, content: content)
  }
  end
end
