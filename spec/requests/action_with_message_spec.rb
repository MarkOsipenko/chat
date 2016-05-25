require 'rails_helper'

RSpec.describe "Message Action", type: :request do
  subject { page }

  let!(:user) { create :user }
  let!(:room) { create :room, owner_id: user.id }
  let!(:message) { create :message, user: user, room: room }

  describe "message in room" do
    before do
      authentication(user)
    end

    it { is_expected.to have_content("My rooms") }

    context "connect to room" do
      before do
        user.rooms << room
        visit user_room_path(user, room)
      end

      xit { is_expected.to have_content("Disconnect from:") }
      it { is_expected.to have_content("geeks room") }
      it { is_expected.to have_content("Hello world") }

      context "send" do
        before { fill_in "write your message", with: "Goodbye cruel world" }
        it { expect{ click_button "send" }.to change(Message, :count).by(1) }

        context "valid" do
          before { click_button "send" }
          it { is_expected.to have_content("Goodbye cruel world") }
        end

        context "invalid" do
          before { fill_in "write your message", with: "" }
          it { expect{ click_button "send" }.to change(Message, :count).by(0) }
          it { is_expected.not_to have_content("Goodbye cruel world") }
        end
      end
    end
  end

end