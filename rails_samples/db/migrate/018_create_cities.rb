class CreateCities < ActiveRecord::Migration
  def self.up
    # codecite cities
    create_table :cities do |t|
      t.string :name
      t.integer :state_id
      t.timestamps 
    end
    # codecite cities
  end

  def self.down
    drop_table :cities
  end
end

