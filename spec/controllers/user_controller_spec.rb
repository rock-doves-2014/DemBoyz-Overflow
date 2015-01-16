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
end
