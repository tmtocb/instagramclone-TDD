require 'rails_helper'

describe UsersController do

  describe "GET show" do
    before { get :show, params: params }
    let(:params) do
      { id: user.id }
    end
    let!(:user) { create(:user) }

    it "assigns @user" do
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end