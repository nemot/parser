class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.integer :category_id, :default=>0, :null=>false
      t.string  :name, :null=>false
      t.text    :description, :null=>true
      t.string  :cooking_time, :null=>false, :default=>"0 часов"
      t.integer :difficulty_id, :default=>1
      t.text    :todo, :null=>false
      t.text    :advices, :null=>false
      t.integer :calorific_value, :default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
