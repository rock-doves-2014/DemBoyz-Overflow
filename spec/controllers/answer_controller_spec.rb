require 'rails_helper'

# Code doesn't work here, but the ideal would be tests that look like this.

describe AnswersController do
  let(:user) { create(:user) }
  let!(:question) { create(:question) }
  let!(:answer) { create(:answer, question_id: question.id) }

  before(:each) do
    session[:user_id] = user.id
  end

  describe "POST create" do
    it "creates a new Answer" do
      expect {
        post :create, answer: {content: 'Content', question_id: question.id }
      }.to change(Answer, :count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "destroys a requested answer" do
      expect {
        delete :destroy, {:id => answer.to_param}
      }.to change(Answer, :count).by(-1)
    end
  end

  describe "PUT update" do
    it "updates the requested answer" do
      Answer.any_instance.should_receive(:update).with({ "content" => "new content" })
      put :update, {:id => answer.to_param, :answer => { "content" => "new content" }}
    end
  end

end
