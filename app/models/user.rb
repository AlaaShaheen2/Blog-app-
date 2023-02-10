class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 3..25 }
  validates :postCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :photo, presence: true
  validates :bio, presence: true

  def last_three_posts
    posts.order('created_at Desc').limit(3)
  end
end
