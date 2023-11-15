# spec/features/user_profile_spec.rb
require 'rails_helper'

RSpec.feature 'User Profile Page' do
  let(:user) { create(:user, name: 'John Doe', bio: 'A test bio') }

  scenario 'displays user information and bio' do
    visit user_path(user)

    expect(page).to have_selector('.card.mb-3', count: 1)
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Number of posts: 0') # Assuming post_counter defaults to 0
    expect(page).to have_content('Bio')
    expect(page).to have_content('A test bio')
  end

  scenario 'displays recent posts when present' do
    post1 = create(:post, user: user, title: 'First Post', text: 'Content of the first post')
    post2 = create(:post, user: user, title: 'Second Post', text: 'Content of the second post')

    visit user_path(user)

    expect(page).to have_selector('.card.mb-2', count: 2)
    expect(page).to have_content('First Post')
    expect(page).to have_content('Content of the first post')
    expect(page).to have_content('Second Post')
    expect(page).to have_content('Content of the second post')
    expect(page).to have_content('Comment: 0, Likes: 0', count: 2) # Assuming counters default to 0
  end

  scenario 'displays no posts message when no posts are present' do
    visit user_path(user)

    expect(page).to have_content('There are currently no posts for this user in the system.')
  end

  scenario 'links to see all posts' do
    visit user_path(user)

    click_link 'See all Posts'

    expect(page).to have_current_path(user_posts_path(user_id: user.id))
  end

  scenario 'links to create a new post' do
    visit user_path(user)

    click_link 'Create New Post'

    expect(page).to have_current_path(new_user_post_path(user_id: user.id))
  end

end
