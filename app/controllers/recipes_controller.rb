class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
  end

  def create
    # byebug
    @recipe = Recipe.create(params_ing)
    redirect_to @recipe
  end

private
def params_ing
  params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])

end


end
