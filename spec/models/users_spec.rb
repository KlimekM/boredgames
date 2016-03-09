require 'spec_helper'


describe User do
  let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
  let(:usertwo) {User.create(first_name: 'arnold', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
  let(:friendship) {Friendship.create(friend_1_id: user.id, friend_2_id: usertwo.id)}


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

    it 'has an image url when a user is initialized' do
      expect(user.image_url).to eq('http://www.google.com')
    end

    it 'has friends' do
      user = User.create(first_name: 'arnold', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')
      usertwo = User.create(first_name: 'arnold', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')
      friendship = Friendship.create(friend_1_id: user.id, friend_2_id: usertwo.id)
      friendship2 = Friendship.create(friend_1_id: usertwo.id, friend_2_id: user.id)
      expect(user.friends.first).to eq(usertwo)
    end
  end
end
