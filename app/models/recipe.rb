class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(attributes)
    attributes.values.each do |a|
      i = self.ingredients.build(a)
    end
  end

  # def ingredients_attributes
  #   self.ingredients.map do |ingredient|
  #     ingredient
  #   end
  # end

  # def ingredient_attrs=(hash)
  #   array = hash["recipe"]["ingredient_attributes"]
  #   array.each do |a|
  #     ingredient = self.ingredients.create(name: a["name"], quantity: a["quantity"])
  #   end
  # end

  # def ingredient_attrs
  #   self.ingredients.map do |ingredient|
  #     # byebug
  #     ingredient.name
  #     ingredient.quantity
  #   end
  # end
end
