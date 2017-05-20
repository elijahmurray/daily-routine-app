require 'spec_helper'

describe ConnectionsController do
  context 'not authenticated' do
    it 'redirects to sign in' do
      get :index
      expect(page).to redirect_to(new_user_session_path)
    end
  end

  context 'authenticated' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
    end

    it 'shows the connections index' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
