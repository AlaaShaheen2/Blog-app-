require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Waris', postCounter: 0) }

  before { subject.save }

  it 'blank name not allowed' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be of integer and greater than or equal to zero.' do
    subject.postCounter = -5
    expect(subject).to_not be_valid
  end

  it 'test the last method' do
    5.times do |_post|
      Post.create(author: subject, title: 'Hi', text: 'This is my very first post')
    end
    expect(subject.last_three_posts).to eq(subject.posts.last(3))
  end
end
