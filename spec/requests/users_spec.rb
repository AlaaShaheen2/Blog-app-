require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  subject { User.new(name: 'Ahmad', photo: 'some image', bio: 'Good friend', postCounter: 12) }

  before { subject.save }

  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('This page is to list all users')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(id: 1) }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('This page is to list only one user')
    end
  end
end
