class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
