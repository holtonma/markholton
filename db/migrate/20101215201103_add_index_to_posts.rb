class AddIndexToPosts < ActiveRecord::Migration
  def self.up
    add_index :posts,    :id, :unique => true
    add_index :comments, :post_id
    add_index :tags,     :post_id
  end

  def self.down
    remove_index :posts,    :column => :id
    remove_index :comments, :column => :post_id
    remove_index :tags,     :column => :post_id
  end
end
