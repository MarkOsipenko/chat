require 'rails_helper'

RSpec.describe Message, :type => :model do
  let(:user) { create :user}
  let(:message)  { create :message, user: user }

  context "validates" do
    context "respond" do
      subject { message }
      it { is_expected.to respond_to(:body) }
      it { is_expected.to respond_to(:user_id) }
    end

    context "valid body" do
      let(:empty_message) { create :message, body: "", user: user }
      let(:valid_message) { create :message, body: "hello world", user: user }

      it { expect{ empty_message }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Body can't be blank") }
      it { expect(valid_message).to be_valid }
    end

    context "valid user" do
      let(:empty_user) { create :message, body: "My name is..", user: nil }

      it { expect{ empty_user }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end

end