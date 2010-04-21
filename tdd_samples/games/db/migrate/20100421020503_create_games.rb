class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.float :average_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
