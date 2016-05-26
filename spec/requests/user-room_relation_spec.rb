require 'rails_helper'

RSpec.describe "User in rooms", type: :request do
  subject { page }

  let!(:user) { create :user }
  let!(:harry) { create :user, email: "harry.potter@gmail.com" }
  let!(:harrys_room) { create :room, owner_id: harry.id }

  describe "rooms" do
    before { authentication(user) }
    it { is_expected.to have_content("My rooms") }
    it { is_expected.to have_content("All rooms") }

    context "connect to room" do
      it { is_expected.not_to have_content("Disconnect from:")}

      context "click on connect" do
        before { first('.new_rooms > a').click }
        it { is_expected.not_to have_content("Connect to:") }

        # check modal window
        context "disconect from room" do
          before { first('.rooms > a').click }
          it { is_expected.not_to have_content("Disconnect from:")}
          it { expect(find(".new_rooms")).to have_link(harrys_room.name) }
        end
      end
    end

    context "creare room" do
      context "valid" do
        before do
          fill_in "Room name", with: "Awesome room"
          click_button "Add room"
        end
        it { is_expected.to have_link("Awesome room") }
      end

      context "invalid" do
        before { fill_in "Room name", with: "" }
        it { expect{ click_button "Add room" }.to change(Room, :count).by(0) }
      end
    end
  end
end