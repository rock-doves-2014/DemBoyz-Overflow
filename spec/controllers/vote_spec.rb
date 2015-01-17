require 'rails_helper'

describe VotesController do

  FactoryGirl.define do
    factory :vote do
      status = true
    end
  end

  before(:each) do
  user = create(:user)
  session[:user_id] = user.id
  end

  describe 'GET #show' do
    it 'assigns the newly created vote to @vote' do
      vote = FactoryGirl.create(:vote)
      get :show, id: vote
      expect(assigns(:vote)).to eq vote
    end

    it 'should render the show action view' do
      vote = FactoryGirl.create(:vote)
      get :show, id: vote
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new empty Vote to @vote' do
      get :new
      expect(assigns(:vote)).to be_a_new(Vote)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'should save the new vote in the db' do
      expect{
        post :create, vote: FactoryGirl.attributes_for(:vote, status_attributes: false)
        }.to change(Vote, :count).by(1)
    end

    it 'should redirect to show vote action' do
      post :create, vote: FactoryGirl.attributes_for(:vote, status_attributes: true)
      expect(response).to redirect_to vote_path(assigns[:vote])
    end

  end


end





















































