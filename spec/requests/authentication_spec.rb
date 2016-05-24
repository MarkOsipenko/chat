require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }

  context "signup page" do
    before { visit new_user_session_path }
    it { is_expected.to have_content('Log in') }
    it { is_expected.to have_title('Sign in') }
  end
end