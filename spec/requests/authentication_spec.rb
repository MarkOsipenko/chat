require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }
    it { is_expected.to have_button('Log in') }
    it { is_expected.to have_title('Sign in') }
  end

  context "signup page" do
    before { visit new_user_registration_path }
    it { is_expected.to have_content('Sign up') }
    it { is_expected.to have_title('Sign up') }
    it { expect(User.count).to eq(0) }

    context "valid registration" do
      let!(:new_user) { User.create(name: "Stephen", email: "Stephen.Hawking@gmail.com", password: "12345678", password_confirmation: "12345678") }
      before { registration(new_user) }

      it { expect(User.count).to eq(1) }

      context "after valid registration/sign_in" do
       it { is_expected.to have_title("Chat - #{new_user.name}") }
      end

      context "after sign in" do

        context "root path" do
          it { is_expected.to have_content("My rooms") }
          it { is_expected.to have_title("Chat - #{new_user.name}") }
        end

        context "sign out" do
          it { is_expected.to have_link("Logout") }

          context "click logout" do
            before { click_link "Logout"}
            it { is_expected.not_to have_title("Chat - #{new_user.name}")}
            it { is_expected.to have_title("Chat")}
            it { is_expected.to have_content("Log in")}
            it { is_expected.to have_link("Sign in")}
            it { is_expected.to have_content("Sign up")}
          end
        end
      end
    end
  end
end
