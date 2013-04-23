namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_advertisements
    #make_relationships
  end
end

def make_users
  admin = User.create!(username:     "test",
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

  #admin.toggle!(:admin)
  29.times do |n|
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
  users = User.all(limit: 3)
  #adv_img = Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample
  30.times do
    #adv_img = Dir.glob(Rails.root.join("app", "assets", "images", "*")).sample
    #adv_img = Dir.glob(File.join("assets/images", "*")).sample
   users.each { |user|
      adv_img =""# File.basename(Dir.glob("public/public/*").sample)
      content = Faker::Lorem.sentence(10)
      user.advertisements.create!(content: content, img: adv_img)
    }
  end
end
