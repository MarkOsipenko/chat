require 'rails_helper'

RSpec.describe User, :type => :model do

  context "validation" do
    let!(:valid_user) do
       user = User.new(name: "leo", email: "person_1@example.com", password: "blablablabla", password_confirmation: "blablablabla")
       File.open(Rails.root.join("spec", "support", "avatars", "isaac.jpg"), "r") do |avatar|
         user.avatar = avatar
         user.save
       end
       user
     end

    let(:dub_valid_user) { create :user, email: "person_1@example.com" }
    let(:up_email)       { create :user, email: "Person3_2@wow.in.ua" }

    context "respond" do
      subject { valid_user }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:email) }
      it { is_expected.to respond_to(:password) }
      it { is_expected.to respond_to(:password_confirmation) }
    end

    context "valid email" do
      it { expect(valid_user.email).to eq("person_1@example.com") }
      it { expect{ dub_valid_user }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken") }
      it { expect{ create :user, email: ""}.to                         raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@examplem"}.to        raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "a.p erson_2@example.m"}.to    raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@.e.xamp.lem.com"}.to raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@examplem .com"}.to   raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@examplem. com"}.to   raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@.examplem.in.ua"}.to raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ create :user, email: "person_2@.wow.in.ua"}.to      raise_error(ActiveRecord::RecordInvalid) }
      it { expect(up_email.email).to eq("person3_2@wow.in.ua") }
    end

    context "valid password" do
      let(:empty_password) { create :user, password: "", password_confirmation: "" }
      let(:right_password) { create :user, email: "pasword@mail.com", password: "123abcde", password_confirmation: "123abcde" }
      let(:mismatch)       { create :user, password: "123abcde", password_confirmation: "blablabla" }
      it { expect(right_password.password).to eq(right_password.password_confirmation) }
      it { expect{ empty_password }.to raise_error(ActiveRecord::RecordInvalid) }
      it { expect{ mismatch }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end

  context "messages" do
    let!(:user) { create :user }
    let!(:room) { create :room, owner_id: user.id }
    let!(:message) { create :message, body: "HI", user: user, room: room }
    let!(:message1) { create :message, body: "Bye", user: user, room: room }

    it { expect(user.messages.count).to eq(2) }
  end
end
