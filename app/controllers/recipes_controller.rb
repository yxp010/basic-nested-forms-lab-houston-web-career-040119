class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: @recipe.id)
    @recipe.ingredients.build(recipe_id: @recipe.id)
  end

  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:quantity, :name])

  end
end