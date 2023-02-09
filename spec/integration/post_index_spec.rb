require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @user = User.create(
      name: 'Alaa',
      bio: 'Developer',
      photo: 'photo.png'
    )
    @post = Post.create(title: 'About Ruby', text: 'Ruby is good', author_id: @user.id)
    @comment = Comment.create(text: 'Yes true', author_id: @user.id, post_id: @post.id)
    Like.create(author_id: @user.id, post_id: @post.id)

    visit(user_posts_path(@user.id))
  end

  it "shows user's profile picture" do
    expect(page).to have_css('img[src*="photo.png"]')
  end

  it 'shows the users username' do
    expect(page).to have_content('Alaa')
  end

  it 'shows number of posts by user' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'shows posts title' do
    expect(page).to have_content('Post #')
  end

  it 'shows some of the posts body' do
    expect(page).to have_content 'Ruby is good'
  end

  it 'shows the first comment on a post' do
    expect(page).to have_content 'Yes true'
  end

  it 'shows how many comments a post has.' do
    expect(page).to have_content('Comments: 1')
  end

  it 'shows how many likes a post has.' do
    expect(page).to have_content('Likes: 1')
  end

  it 'shows a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('Pagination')
  end

  it 'when user clicks on a post, it redirects to that posts show page' do
    click_link 'Post #'
    expect(page).to have_current_path user_post_path(@post.author_id, @post)
  end
end
