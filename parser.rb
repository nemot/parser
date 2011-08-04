require 'config/environment.rb'
require 'nokogiri'
require 'open-uri'





## Initial states
#Ingredient.delete_all
#Category.delete_all
#Recipe.delete_all
#Difficulty.delete_all
#RecipeIngredient.delete_all


## Getting categories -----------------
#doc = Nokogiri::HTML(open('http://www.gastronom.ru/rcp_cat.aspx?cat_id=4554')) 
#doc.xpath('//ul[@class="nav"]//a').each do |a|
#  puts a.attributes['href']
#end


## Starts from 1001 and ends with 8143
i=1001;
while i<=8143 do 
  doc = Nokogiri::HTML(open('http://www.gastronom.ru/recipe.aspx?id='+i.to_s)) 

#  # Check for image
#  doc.xpath('//div[@class="item"]/child::img') do |img|
#    puts i.to_s+" have image"
#  end

  recipe = {
    :name => doc.xpath('//h1[@property="v:name"]').first.content,
    :cooking_time => doc.xpath('//span[@property="v:cookTime"]').first.content,
    :difficulty => {:name=> doc.xpath('//span[@id="SuperContent_LeftColumnContent_m_recipeCard_m_textDifficult"]').first.content},
    :calorific_value => {:name => doc.xpath('//span[@property="v:calories"]').first.content},
    :todo => doc.xpath('//div[@property="v:instructions"]').first.content
  }

  puts recipe.inspect  
  

#  # Seaching for ingridient
#  doc.xpath('//div[@typeof="v:Ingredient"]').each do |ing|
#    name = ing.xpath('p[@property="v:name"]').first.content
#    quant = ing.xpath('p[@property="v:amount"]').first.content
#    # Ingredient have right format
#    Ingredient.create({:name => name, :quantity => quant, :dirty => name.match(/[0-9]+/) })
#    puts i.to_s
##    unless name.match(/[0-9]+/)
##      puts "#{name}  ||||||||||||||   #{quant}" 
##    end
#  end

  i+=1
end

