class CreateStates < ActiveRecord::Migration
  def self.up
    # codecite states
    create_table :states do |t|
      t.string :name
      t.integer :capital_id
      t.timestamps 
    end
    # codecite states
  end

  def self.down
    drop_table :states
  end
end

