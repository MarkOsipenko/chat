FactoryGirl.define do
  factory :message do
    body "Hello world"
    user
  end
end
