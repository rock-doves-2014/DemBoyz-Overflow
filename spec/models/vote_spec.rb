require 'rails_helper'

describe Vote do
  it 'is valid with a true' do
    vote = Vote.new(
      status: true)
    expect(vote).to be_valid
  end

end
