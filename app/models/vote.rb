class Vote < ActiveRecord::Base
  belongs_to :game
  belongs_to :voter, class_name: "User"
end
