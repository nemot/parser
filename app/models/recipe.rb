class Recipe < ActiveRecord::Base
  has_many :ingridients
  belongs_to :difficulty
  belongs_to :category
  
  has_many :ingridients, :through=>:recipe_ingredient
  
end
