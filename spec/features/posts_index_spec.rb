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

    scenario 'displays user posts when present' do
    post = create(:post, user: user, title: 'First Post', text: 'Content of the first post')
    create(:comment, user: user, post: post, text: 'A comment on the first post')

    visit user_path(user)

    expect(page).to have_content('First Post')
    expect(page).to have_content('Content of the first post')
    expect(page).to have_content('Comment: 1, Likes: 0') # Assuming counters default to 0
    expect(page).to have_content('A comment on the first post')
  end


end
