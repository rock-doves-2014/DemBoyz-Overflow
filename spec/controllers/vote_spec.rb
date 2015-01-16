require 'rails_helper'

describe VotesController do

#  WITH NO PARAMS, THIS WORKS. WHY?
  FactoryGirl.define do
    factory :vote do
      # status = true
    end
  end

  describe 'GET #show' do
    it 'assigns the newly created vote to @vote' do
      vote = create(:vote)
      get :show, id: vote
      expect(assigns(:vote)).to eq vote
    end

    it 'should render the show action view' do
      vote = create(:vote)
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

#THESE TESTS NEED REVIEW AND POSSIBLY FURTHER TESTING
  describe 'POST #create' do
    it 'should save the new vote in the db' do
      expect{
        post :create, vote: attributes_for(:vote, status_attributes: false)
        }.to change(Vote, :count).by(1)
    end

    it 'should redirect to show vote action' do
      post :create, vote: attributes_for(:vote, status_attributes: true)
      expect(response).to redirect_to vote_path(:vote)
      # this vote_path is not taking the :vote... it reroutes to votes/vote
    end

  end


end





















































