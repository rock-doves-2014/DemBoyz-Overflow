require 'rails_helper'

describe User do
  let(:user)
  it 'is not valid without an email' do
    user = create(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is valid with all attributes' do
    expect(user).to be_valid
  end
end
