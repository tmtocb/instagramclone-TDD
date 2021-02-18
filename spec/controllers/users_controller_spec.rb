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
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let(:user) { create(:user, website: 'tmt1example.com' ) }

    context 'when user is signed in' do
      before do
        sign_in(user)
      end

      context 'valid params' do
        let(:params) do
          { id: user.id, user: { website: 'tmt2example.com', phone: '695454232' } }
        end

        it 'updates user' do
          expect { subject }
            .to change { user.reload.website }
            .from('tmt1example.com')
            .to('tmt2example.com')
            .and change { user.reload.phone }
            .from(nil)
            .to(695454232)
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: user.id, user: { email: '' } }
        end

        it 'does not update user' do
          expect { subject }.not_to change { user.reload.email }
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { id: user.id, user: { email: 'tmt2@example.com', phone: '695454232' } }
        end

        it 'does not update user' do
          expect { subject }.not_to change { user.reload.email }
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: user.id, user: { email: '' } }
        end

        it 'does not update user' do
          expect { subject }.not_to change { user.reload.email }
        end
      end
    end
  end
end