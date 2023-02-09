require 'rails_helper'

RSpec.describe 'Users controller test', type: :request do
  subject { @user = User.create(name: 'Alaa', photo: 'alaa.png', bio: 'Developer', postCounter: 2) }

  before { subject.save }

  describe 'GET #index' do
    before(:example) { get users_path }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct routes' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text in the response body' do
      expect(response.body).to include(@user.photo)
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(id: @user.id) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct route' do
      expect(response).to render_template(:show)
    end

    it 'has the correct placeholder text in the response body' do
      expect(response.body).to include(@user.photo)
    end
  end
end
