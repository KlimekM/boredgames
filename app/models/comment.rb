class Comment < ActiveRecord::Base
  belongs_to :game
  belongs_to :commenter, class_name: "User"
end
