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

  describe 'GET edit' do
    subject { get :edit, params: params }
    let(:params) do
      { id: user.id }
    end
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in(user)
        subject
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'when user is NOT signed in' do
      it 'does not assign @user' do
        expect(assigns(:user)).to eq(nil)
      end

      it do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end