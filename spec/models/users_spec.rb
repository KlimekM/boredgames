require 'spec_helper'


describe User do
  let(:user) {User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password')}

  describe 'initialize' do
    it 'has a first name' do
      expect(user.first_name).to eq('ray')
    end

    it 'has a last' do
      expect(user.last_name).to eq('curran')
    end

    it 'has a username' do
      expect(user.username).to eq('rpcurr')
    end

    it 'generates a password digest when a user is initialized' do
      expect(user.password_digest).to_not eq(nil)
    end
  end
end
