require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let!(:post) { Post.create(title: 'Title Example', body: 'Body Example') }

  it "has a title" do
    expect(post.title).to eq 'Title Example'
  end

  it "has a body" do
    expect(post.body).to eq 'Body Example'
  end

  it "is valid with both title and body" do
    expect(post).to be_valid
  end

  it "is not valid without a title" do
    post.title = nil
    expect(post).to_not be_valid
  end

  it "is not valid without a body" do
    post.body = nil
    expect(post).to_not be_valid
  end
end
