require 'spec_helper'

describe FriendshipsController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:usertwo) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}

  def create_friendship
    post :create, current_user: user, id: usertwo.id
  end

  def destroy_friendship
    delete :destroy, friend: user, id: usertwo.id
  end

  describe "create" do

    it "adds a user as a friend" do
      create_friendship
      expect(user.friends.first).to eq(usertwo)
    end

    it "adds the friended person as a friend" do
      create_friendship
      expect(usertwo.friends.first).to eq(user)
    end

    it "redirects back to the other user's page" do
      create_friendship
      expect(response).to redirect_to(user_path(usertwo))
    end
  end

  describe "destroy" do
    it "deletes the friendship from the original person" do
      create_friendship
      destroy_friendship
      expect(user.friends.first).to_not eq(usertwo)
    end

    it "deletes the friendship from the other person" do
      create_friendship
      destroy_friendship
      expect(usertwo.friends.first).to_not eq(user)
    end

    it "redirects back to the other user's page" do
      create_friendship
      destroy_friendship
      expect(response).to redirect_to(user_path(usertwo))
    end
  end

end
