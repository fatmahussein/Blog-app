class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Callbacks
  after_save :update_like_counter

  def update_like_counter
    post.increment!(:like_counter)
  end
end
