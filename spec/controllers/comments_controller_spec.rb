describe CommentsController do
  let!(:comment) { Comment.create!(text: "Great game!", game_id: 4, user_id: 4) }

describe "GET #new" do
  it "assigns @comment as a new instance of Comment" do
    get :new
    expect(assigns(:comment).to be_a(Comment)
  end
end