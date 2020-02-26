# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @auth = sign_in_user('example@email.com')
    @post = create(:post, user_id: @user.id)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
