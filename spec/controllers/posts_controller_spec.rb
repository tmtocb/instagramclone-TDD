require 'rails_helper'

describe PostsController do

  describe 'GET new' do
    context 'when user is signed in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :new
      end

      it 'assigns @post' do
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      it 'not assigns @post' do
        expect(assigns(:post)).to eq(nil)
      end

      it 'renders the new template' do
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }
      before { sign_in(user) }

      context 'valid params' do
        let(:params) do
          file = fixture_file_upload(Rails.root.join('public', 'avatar.jpg'), 'image/jpg')
          { post: { description: 'abcdefghijklmnoprstuwxyz', image: file } }
        end

        it 'creates new post' do
          expect { subject }.to change(Post, :count).from(0).to(1)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { post: { description: '' } }
        end

        it 'does not create new post' do
          expect { subject }.not_to change(Post, :count)
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { post: { description: 'abcdefghijklmnoprstuwxyz' } }
        end

        it 'does not create new post' do
          expect { subject }.not_to change(Post, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { post: { description: '' } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Post, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end