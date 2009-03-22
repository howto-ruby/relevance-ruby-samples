# codecite migration
class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :salary, :length
      t.references :player, :team
      t.timestamps 
    end
  end

  def self.down
    drop_table :contracts
  end
end
# codecite migration