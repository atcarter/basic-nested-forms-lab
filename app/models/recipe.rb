class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(attributes)
    attributes.values.each do |a|
      i = self.ingredients.build(a)
    end
  end
end
