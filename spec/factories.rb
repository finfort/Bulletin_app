FactoryGirl.define do
  factory :user do
    username  "Test User"
    email "test@test.com"
    full_name "Test User Userovich"
    address  "15 Broadway"
    city     "New York"
    state     "New York"
    country   "Unated States of America"
    zip        23333
    birthday   1990-15-12
    password "test"
    password_confirmation "test"

  end
end
