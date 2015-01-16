require 'rails_helper'


describe QuestionsController do
  describe "POST create" do
    it "creates a new Question" do
      expect {
        post :create, question: {:questions => { :title => 'Title', :content => 'Content' }}
      }.to change(Question, :count).by(1)
    end
  end


  describe "DELETE destroy" do
    it "destroys a requested question" do
      question = Question.create!(title: 'Title', content: 'Content')
      expect {
        delete :destroy, {:id => question.to_param}
      }.to change(Question, :count).by(-1)
    end
  end

  describe "PUT update" do
    it "updates the requested question" do
      question = Question.create!(title: 'Title', content: 'Content')
      Question.any_instance.should_receive(:update).with({ "title" => "new title" })
      put :update, {:id => question.to_param, :question => { "title" => "new title" }}
    end
  end

end
