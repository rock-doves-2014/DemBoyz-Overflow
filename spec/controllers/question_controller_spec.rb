require 'rails_helper'

describe QuestionsController do
  describe "POST create" do
    it "creates a new Question" do
      expect {
        post :create, question: {:questions => { :title => 'Title', :content => 'Content' }}
      }.to change(Question, :count).by(1)
    end
  end
end


