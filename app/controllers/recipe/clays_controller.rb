class Recipe::ClaysController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @clay = @recipe.clay
    render partial: 'recipes/clays/index', locals: { clay: @clay }
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @clay = Clay.find(params[:clay_id])
    @recipe.clay = @clay
    @recipe.save!

    return head(:ok)
  end
end
