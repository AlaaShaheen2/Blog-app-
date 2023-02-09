require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(post_id: 4, author_id: 6)
  end

  before do
    subject.save
  end

  it 'if created correctly' do
    expect(subject.post_id).to eq(4)
  end

  it 'check if the post_id is integer' do
    subject.post_id = 7.5
    expect(subject).to_not be_valid
  end

  it 'test the update_likes_counter method' do
    author = User.create!(name: 'Alaa', photo: 'photo.jpg', bio: 'Developer', postCounter: 3)
    post = Post.create!(author:, title: 'Ruby', text: 'Alaa talks about Ruby!', comments_counter: 20,
                        likes_counter: 16)
    Like.create!(author:, post:)
    lastpost = Post.last
    expect(lastpost.likes_counter).to eq 1
  end
end
