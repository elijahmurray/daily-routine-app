require 'spec_helper'

describe RoutinesController do
  context 'not signed in' do
    it 'redirects to new session path' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  context 'authenticated user' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
    end

    it 'redirects to index' do
      get :index
      expect(page).to render_template(:index)
    end
  end
end
