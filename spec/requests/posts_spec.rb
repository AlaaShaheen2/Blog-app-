require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  user = User.create(name: 'Ahmad', photo: 'Some image', bio: 'Good friend', postCounter: 12)
  subject do
    Post.new(title: 'Something', text: 'This is test post', comments_counter: 4, likes_counter: 6,
             author: user)
  end

  before { subject.save }

  describe 'GET #index' do
    before(:each) { get user_posts_path(user_id: 1) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('This page is to list all posts of one user')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path(user_id: 1, id: 1) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('This page is to list one post of one user')
    end
  end
end
