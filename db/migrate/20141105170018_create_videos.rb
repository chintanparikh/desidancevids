class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_url
      t.string :team
      t.string :season
      t.string :event
      t.string :school
      t.integer :placement, default: nil
      t.timestamps null: false
    end
  end
end
