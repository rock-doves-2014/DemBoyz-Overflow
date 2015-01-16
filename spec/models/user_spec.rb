require 'rails_helper'

describe User do
  it 'is not valid without an email' do
    user = User.new(name: 'Jorge', password_digest: '12345')
    expect(user).not_to be_valid
  end

  it 'is valid with all attributes' do
    user = User.new(name: 'Jorge', email: 'jorge@test.com', password_digest: '12345')
    expect(user).to be_valid
  end
end
