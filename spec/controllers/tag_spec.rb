require 'rails_helper'

describe TagsController do

  # this should be stored inside of a factories subdir of spec/
  FactoryGirl.define do
    factory :tag do
      title { Faker::Lorem.word }
    end
  end

  before(:each) do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe 'GET #show' do
    it 'assigns the requested tag to @tag' do
      tag = FactoryGirl.create(:tag)
      get :show, id: tag
      expect(assigns(:tag)).to eq tag
    end

    it 'renders the :tag template' do
      tag = FactoryGirl.create(:tag)
      get :show, id: tag
      expect(response).to render_template :show
    end
  end


end
