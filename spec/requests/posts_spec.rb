require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'John', id: 1) }

  def create_post(author)
    Post.create(
      title: 'Posting',
      text: 'This is a post',
      author:
    )
  end

  describe 'GET /index' do
    before do
      user_post = create_post(user)
      get user_posts_path(user_name: user.name)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>All Posts</h1>')
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'John', id: 1) }
    let(:post) { create_post(user) }

    before do
      get user_post_path(user_name: user.name, id: post.id)
    end
  end
end
