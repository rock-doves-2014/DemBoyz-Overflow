require 'rails_helper'

describe UsersController do
  FactoryGirl.define do
    factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.free_email }
      password { Faker::Internet.password }
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it 'renders the show template' do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the root_path" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new user" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.not_to change(User, :count)
      end

      it "redirects back to the new_user_path" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to redirect_to new_user_path
      end
    end

  end

end
