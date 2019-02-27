require "spec_helper"
require 'dashboard'

describe Dashboard do
  describe '#posts' do
    it 'returns posts visible to the current user' do
      posts = double('posts')
      user = double('user')
      visible_posts = double('visible_posts')
      allow(posts).to receive(:visible_to).with(user).and_return(visible_posts)

      result = dashboard.posts
      result = Dashboard.new(posts: posts, user: user).posts

      expect(result.map(&:title)).to match_array(%w(
        published_one
        published_two
        visible_one
        visible_two
      ))
    end
  end
end
