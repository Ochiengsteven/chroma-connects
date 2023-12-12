require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'steve', photo: 'https://unsplash.com/photos/F_-0000BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Mr', text: 'Hello all!') }

  describe 'GET /index' do
    before { get users_url }

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>All Users</h1>')
    end
  end
end
