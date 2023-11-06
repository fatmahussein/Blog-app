class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Callbacks
  after_save :update_post_comment_counter

  # Methods
  def update_post_comment_counter
    post.increment!(:comment_counter)
  end
end
