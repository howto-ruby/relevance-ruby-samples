# codecite migration
class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :body
      t.references :notable, :polymorphic => true
      t.timestamps 
    end
  end

  def self.down
    drop_table :notes
  end
end
# codecite migration