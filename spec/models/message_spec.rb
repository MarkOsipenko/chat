require 'rails_helper'

RSpec.describe Message, :type => :model do
  let(:user) { create :user}
  let(:message)  { create :message, user: user }

  context "resrond" do
    subject { message }
    it { is_expected.to respond_to(:body) }
    it { is_expected.to respond_to(:user_id) }
  end
end