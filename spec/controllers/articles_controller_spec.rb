require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:valid_attributes) {
    { title: 'Test title!', body: 'This is a test description', user_id: 10, category_id: 10, status: 'public' }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
end
