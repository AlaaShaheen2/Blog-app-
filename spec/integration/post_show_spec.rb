require 'rails_helper'

RSpec.describe 'Posts Show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Alaa',
      photo: 'alaa.png',
      bio: 'Developer',
      postCounter: 0
    )

    @user1 = User.create(
      name: 'Ahmed',
      bio: 'MERN Developer',
      photo: 'ahmed.png',
      postCounter: 5
    )

    @post = Post.create(
      author_id: @user.id,
      title: 'About Ruby',
      text: 'Ruby is easy to learn',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'It really is')
    Comment.create(post_id: @post.id, author_id: @user.id, text: 'Ruby is fun')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'Ruby is wow')
    Like.create(post_id: @post.id, author_id: @user1.id)
  end

  describe 'To test post show page methods' do
    it 'displays the post title' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('About Ruby')
    end

    it 'displays the post author' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Alaa')
    end

    it 'displays the comments counter' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Comments: 3')
    end

    it 'displays the likes counter' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'displays the post body' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Ruby is easy to learn')
    end

    it 'displays the user name of each commentor' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Ahmed')
    end

    it 'displays the comment text' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('It really is')
      expect(page).to have_content('Ruby is fun')
      expect(page).to have_content('Ruby is wow')
    end
  end
end
