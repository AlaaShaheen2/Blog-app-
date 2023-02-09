require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  subject do
    @user = User.create(name: 'Alaa', photo: 'photo.jpg', bio: 'Developer', postCounter: 3)
    @post = Post.create(title: 'Ruby', text: 'Alaa talks about Ruby!', comments_counter: 20, likes_counter: 16,
                        author: @user)
  end

  before { subject.save }

  describe 'GET #index' do
    before(:each) { get user_posts_path(user_id: @user.id) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include(@post.text)
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path(user_id: @user.id, id: @post.id) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include(@post.text)
    end
  end
end
