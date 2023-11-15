# spec/features/new_post_spec.rb
require 'rails_helper'

RSpec.feature 'Create New Post' do
  let(:user) { create(:user) }

  scenario 'user submits a valid post' do
    visit new_user_post_path(user)

    fill_in 'Title', with: 'Test Post'
    fill_in 'Content', with: 'This is the content of the test post'

    click_button 'Create Post'

    expect(page).to have_content('Post created successfully')
    expect(page).to have_content('Test Post')
    expect(page).to have_content('This is the content of the test post')
  end

  scenario 'user submits an invalid post' do
    visit new_user_post_path(user)

    # Do not fill in any fields to simulate an invalid submission

    click_button 'Create Post'

    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Text can\'t be blank')
  end
end
