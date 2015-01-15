require 'rails_helper'

describe Tag do

  it 'is valid with a title' do
    tag = Tag.new(
      title: "tribute")
    expect(tag).to be_valid
  end


end
