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
      user_post = create_post(user) # rubocop:disable Lint/UselessAssignment
      get user_posts_path(user.id)
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
end
