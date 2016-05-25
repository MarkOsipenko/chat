FactoryGirl.define do
  factory :user do
    name "Isaac"
    email "person_1@example.com"
    password "blablablabla"
    password_confirmation "blablablabla"
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'avatars', 'albert.jpg')) }
  end
end
