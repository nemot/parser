class CreateRecipeIngredients < ActiveRecord::Migration
  def self.up
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id,     :default=>0
      t.string  :name,          :null=>true
      t.integer :ingredient_id, :null=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_ingredients
  end
end
