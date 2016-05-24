require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }

  context "signin page" do
    before { visit new_user_session_path }
    it { is_expected.to have_button('Log in') }
    it { is_expected.to have_title('Sign in') }
  end

  context "signup page" do
    before { visit new_user_registration_path }
    it { is_expected.to have_content('Sign up') }
    it { is_expected.to have_title('Sign up') }

    context "valid registration" do
      let!(:new_user) { User.new(name: "Stephen", email: "Stephen.Hawking@gmail.com", password: "12345678", password_confirmation: "12345678") }
      before do
       fill_in "Name", with: new_user.name
       fill_in "Email", with: new_user.email
       fill_in "Password", with: new_user.password
       fill_in "Password confirmation", with: new_user.password_confirmation
      end
      it { expect{ click_button "Sign up" }.to change(User, :count).by(1) }

      context "after valid registration/sign_in" do
       before { click_button "Sign up" }
       it { is_expected.to have_title("Chat - #{new_user.name}") }
      end

      context "after sign in" do
        before { click_button "Sign up" }

        context "root path" do
          it { is_expected.to have_content("My rooms") }
          it { is_expected.to have_title("Chat - #{new_user.name}") }
        end
      end
    end
  end
end