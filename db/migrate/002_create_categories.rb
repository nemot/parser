class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :category_id, :default=>0
      t.string  :name, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
