class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    # byebug
    @recipe = Recipe.new(recipe_params)
    # @ingredient1 = Ingredient.new(name: )
    # @ingredient2 = Ingredient.new(recipe_params["ingredients_attributes"].to_h[1])
    # byebug
    # @recipe.ingredients << @ingredient1
    # @recipe.ingredients << @ingredient2
    if @recipe.save
      @recipe.ingredients.compact
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
    # params.require(:recipe)
  end

  # def ingredients_hash
  #   recipe_params["ingredients_attributes"].to_h
  # end

  # def ing_name
  #   ingredients_array["0"]
  # end

  # def ing_quantity

  # end
end
