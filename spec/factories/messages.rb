FactoryGirl.define do
  factory :message do
    body "Hello world"
    user
    room
  end
end
