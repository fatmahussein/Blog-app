require 'rails_helper'

RSpec.feature 'User Profile Page' do
  let(:user) { create(:user, name: 'John Doe', bio: 'A test bio') }

  scenario 'displays user information and bio' do
    visit user_path(user)

    expect(page).to have_content('John Doe')
    expect(page).to have_content('Number of posts: 0') # Assuming post_counter defaults to 0
    expect(page).to have_content('Bio')
    expect(page).to have_content('A test bio')
  end
end
