require 'rails_helper'

RSpec.describe Room, :type => :model do
  let!(:user) { create :user }
  let!(:room) { create :room, name: "geeks", owner_id: user.id }

  context "validation" do
    context "respond" do
      subject { room }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:owner_id) }
    end

    context "valid name" do
      it { expect(room.name).to eq("geeks") }
    end

    context "invalid name" do
      let(:invalid_room) { create :room, name: "", owner_id: user.id }
      it { expect{ invalid_room }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank") }
    end

    context "uniqueness" do
      before { user.rooms << room }
      it { expect{ user.rooms << room }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Room has already been taken") }
    end
  end
end
