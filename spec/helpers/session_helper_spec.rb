require 'spec_helper'

describe SessionsHelper do
  let(:user) {User.create!(first_name: 'barb', last_name: 'hernandez', password: 'password', username: 'barbie')}

  describe '#authorized' do
    it 'compares the current user id correctly if its the same' do
      session[:user_id] = user.id
      expect(authorized(user.id)).to be true
    end
  end
end
