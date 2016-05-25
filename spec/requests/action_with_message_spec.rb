require 'rails_helper'

RSpec.describe "Message Action", type: :request do
  subject { page }

  let!(:user) { create :user }
  let!(:room) { create :room, owner_id: user.id }
  let!(:message) { create :message, user: user, room: room }

  describe "message in room" do
    before do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    it { is_expected.to have_content("My rooms") }

    context "connect to room" do
      before do
        user.rooms << room
        visit user_room_path(user, room)
      end

      it { is_expected.to have_content("Disconnect from:") }
      it { is_expected.to have_content("geeks room") }
      it { is_expected.to have_content("Hello world") }

      context "create message" do
        before { fill_in "write your message", with: "Goodbye cruel world" }
        it { expect{ click_button "create message" }.to change(Message, :count).by(1) }

        context "message in chat" do
          before { click_button "create message" }
          it { is_expected.to have_content("Goodbye cruel world") }
          it { is_expected.to have_content("Goodbye cruel world") }
        end
      end
    end
  end

end