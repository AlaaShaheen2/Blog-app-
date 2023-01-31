class Post < ApplicationRecord
  after_save :update_posts_counter
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def last_five_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_posts_counter
    author.update(postCounter: author.posts.length)
  end
end
