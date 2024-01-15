class User < ApplicationRecord
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Validations
  validates :name, presence: true, if: -> { new_record? } # Make name required only for new records
  validates :post_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Methods
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
