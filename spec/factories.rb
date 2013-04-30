FactoryGirl.define do
  factory :user do #, aliases: [:author, :commenter]
    sequence(:username) {|n| "user#{n}" }
    sequence(:email) {|n| "testfactory#{n}@example.com" }
    full_name "Test User Userovich"
    address   "15 Broadway"
    city      "New York"
    state     "New York"
    country   "Unated States of America"
    zip       "23333"
    birthday   Time.now
    password  "test"
    password_confirmation "test"
  end
end
FactoryGirl.define do
  factory :advertisement do
    content "test text"
    association :user
  end
end

FactoryGirl.define do
  factory :comment do
    author_name "FactoryGirl"
    site_url    "FactoryURL"
    content     "FactoryText"
    association :advertisement
  end
end
