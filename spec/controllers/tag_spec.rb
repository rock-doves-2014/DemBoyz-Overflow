require 'rails_helper'

describe TagsController do

FactoryGirl.define do
  factory :tag do
    title { Faker::Lorem.word }
  end
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

  describe 'GET #new' do
    it 'assigns a new Tag to @tag' do
      get :new
      expect(assigns(:tag)).to be_a_new(Tag)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

end