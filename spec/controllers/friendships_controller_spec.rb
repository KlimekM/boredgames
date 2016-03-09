require 'spec_helper'

describe FriendshipsController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:usertwo) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}

  def create_friendship
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
    puts user.id
    puts usertwo.id
    post :create, current_user: user, id: usertwo.id
  end

  describe "create" do

    it "adds a user as a friend" do
      create_friendship
      expect(user.friends.first).to eq(usertwo)
    end

    it "redirects back to the other user's page" do
      create_friendship
      expect(response).to redirect_to(user_path(usertwo))
    end
  end

  # describe "destroy" do
  #   it "deletes a game from a user's collection" do
  #   end
  # end

end
