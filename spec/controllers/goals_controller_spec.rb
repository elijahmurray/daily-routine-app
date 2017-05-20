require 'spec_helper'

describe GoalsController do
  let(:current_user) { double } 

  before do
    allow(current_user).to receive(:goals) {  } 
  end

  context 'not signed in' do
    it 'redirects to new session path' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  context 'authenticated user' do
    let(:current_user) { FactoryGirl.create(:user) }

    before { sign_in current_user }

    it "renders the index template" do
      get :index
      expect(page).to render_template(:index)
    end
  end
end
