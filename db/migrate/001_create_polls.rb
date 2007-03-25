class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.column :created_at, :timestamp
      t.column :description, :text  
    end
    add_index :polls, :created_at
  end
  
  def self.down
    drop_table :polls
    remove_index :polls, :created_at
  end
end
