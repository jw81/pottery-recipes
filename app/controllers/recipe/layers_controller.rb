class Recipe::LayersController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @layers = @recipe.layers
    render partial: 'recipes/layers/index', locals: { layers: @layers }
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.layers.create!(coat_type: params[:coat_type], glaze_id: params[:glaze_id])

    return head(:ok)
  end
end
