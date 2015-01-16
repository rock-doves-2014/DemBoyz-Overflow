require 'rails_helper'

describe AnswersController do
  describe "POST create" do
    question = Question.create(title:'Title', content: 'Content')
    it "creates a new Answer" do
      expect {
        post :create, answer: {:answers => {:content => 'Content', :question_id => Question.last.id }}
      }.to change(Answer, :count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "destroys a requested answer" do
      question = Question.create(title:'Title', content: 'Content')
      answer = Answer.create!(content: 'Content', question_id: question.id)
      expect {
        delete :destroy, {:id => answer.to_param}
      }.to change(Answer, :count).by(-1)
    end
  end

  describe "PUT update" do
    it "updates the requested answer" do
      question = Question.create!(title: 'Title', content: 'Content')
      answer = Answer.create!(content: 'Content', question_id: question.id)
      Answer.any_instance.should_receive(:update).with({ "content" => "new content" })
      put :update, {:id => answer.to_param, :answer => { "content" => "new content" }}
    end
  end

end
