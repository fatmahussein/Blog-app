require 'rails_helper'

RSpec.feature 'Users Index Page' do
  scenario 'displays a message when @users is blank' do
    visit users_path

    expect(page).to have_content('There are no users currently in the system.')
    expect(page).not_to have_selector('.main') # Ensure no user profiles are displayed
  end

  scenario 'displays user profiles when @users is not blank' do
    # Assuming you have some users in the test database
    user1 = create(:user, name: 'John Doe', post_counter: 5)
    user2 = create(:user, name: 'Jane Doe', post_counter: 3)

    visit users_path

    expect(page).not_to have_content('There are no users currently in the system.')

    within '.main' do
      expect(page).to have_selector('.main-1 img[src="' + user1.photo + '"]')
      expect(page).to have_selector('.main-2 .card-body h5', text: 'John Doe')
      expect(page).to have_selector('.main-2 .card-body p', text: 'Number of posts: 5')

      expect(page).to have_selector('.main-1 img[src="' + user2.photo + '"]')
      expect(page).to have_selector('.main-2 .card-body h5', text: 'Jane Doe')
      expect(page).to have_selector('.main-2 .card-body p', text: 'Number of posts: 3')
    end
  end
end
