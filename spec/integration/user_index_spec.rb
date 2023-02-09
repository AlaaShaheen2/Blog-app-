require 'rails_helper'

RSpec.describe 'User Main Page', type: :feature do
  before :each do
    @user = User.create(name: 'Alaa', photo: 'photo.png', bio: 'Develper', postCounter: 12)
  end

  describe 'User main page' do
    before(:each) { visit users_path }

    it 'shows the container for all the users' do
      expect(page).to have_css('section.users_container')
    end

    it 'shows the username of each user' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'shows the photos of each user' do
      User.all.each do |user|
        expect(page.has_xpath?("//img[@src = '#{user.photo}' ]"))
      end
    end

    it 'shows the number of posts of each user' do
      User.all.each do |user|
        expect(page).to have_content("Number of posts: #{user.postCounter}")
      end
    end

    it "redirects to the user's show action" do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
