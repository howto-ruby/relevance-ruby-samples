class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :stars
      t.text :comments
      t.belongs_to :user
      t.belongs_to :game

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
