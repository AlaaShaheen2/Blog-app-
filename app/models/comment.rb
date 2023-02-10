class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_counter
  after_destroy :delete_posts_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.length)
  end

  def delete_posts_counter
    post.decrement!(:comments_counter)
  end
end
