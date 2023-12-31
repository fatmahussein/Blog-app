require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Shaheer', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          post_counter: 1)
    @post1 = Post.create!(author: @user1, title: 'First Post', text: 'First text', comment_counter: 2,
                          like_counter: 1)
    @comment1 = Comment.create!(post: @post1, user: @user1, text: 'Hi Shaheer!')
    @comment2 = Comment.create!(post: @post1, user: @user1, text: 'Hi Shaheer!')
    @like1 = Like.create!(post: @post1, user: @user1)
  end

  describe 'Show page' do
    it "should display the post's title" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.title)
    end

    it "should display the post's author" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@user1.name)
    end

    it "should display the post's number of comments" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.comment_counter)
    end

    it "should display the post's number of likes" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.like_counter)
    end

    it "should display the post's body" do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@post1.text)
    end

    it 'should display the username of each commentator' do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@user1.name)
    end

    it 'should display the text of each comment' do
      visit user_posts_path(@user1, @post1)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
  end
end
