require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Zia', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.')
    @user2 = User.create!(name: 'Ali', photo: 'https://unsplash.com/photos/2.jpg', bio: 'Teacher from Mexico.')
    @user3 = User.create!(name: 'Rashid', photo: 'https://unsplash.com/photos/3.jpg', bio: 'Teacher from Mexico.')
  end

  describe 'index page' do
    it 'should display the username of all other users' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end
  end
end
