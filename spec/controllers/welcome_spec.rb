require 'rails_helper'

describe WelcomeController do

  describe 'GET #login' do
    context 'with valid attributes' do
      it "assigns the user's id to session[:user_id]" do
        user = create(:user)
        session[:user_id] = nil
        post :login, id: user, password: user.password
        expect(session[:user_id]).to eq(user.id)
      end
      it "redirects to the user_path" do
        user = create(:user)
        session[:user_id] = nil
        post :login, id: user, password: user.password
        expect(response).to redirect_to user_path(user)
      end
    end

    context 'with invalid attributes' do
      it "doesn't assign the user's id to session[:user_id]" do
        user = create(:user)
        session[:user_id] = nil
        post :login, id: user, password: 'invalid_id'
        expect(session[:user_id]).not_to eq(user.id)
      end
      it "redirects to the root_path" do
        user = create(:user)
        session[:user_id] = nil
        post :login, id: user, password: 'invalid_id'
        expect(response).to redirect_to root_path
      end
    end

  end

  describe 'GET #logout' do
    it "sets session[:user_id] to nil" do
      user = create(:user)
      session[:user_id] = user.id
      get :logout
      expect(session[:user_id]).not_to eq(user.id)
    end
    it "redirects to the root_path" do
      user = create(:user)
      session[:user_id] = nil
      get :logout
      expect(response).to redirect_to root_path
    end
  end

end
