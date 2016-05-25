include ApplicationHelper

def registration(user)
  visit new_user_registration_path
  # binding.pry

  attach_file("user[avatar]", Rails.root.join('spec', 'support', 'avatars', 'albert.jpg'))
  fill_in "Name", with: new_user.name
  fill_in "Email", with: new_user.email
  fill_in "Password", with: new_user.password
  fill_in "Password confirmation", with: new_user.password_confirmation
  first('.actions').click_button('sign_up')
end


def authentication(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end