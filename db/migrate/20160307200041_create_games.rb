class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :release_year
      t.string :player_range
      t.string :image_url
      t.string :publisher
      t.string :play_time
      t.string :description
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
