class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Callbacks
  after_save :update_user_post_counter

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Methods
  def update_user_post_counter
    author.increment!(:post_counter)
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
