# Actions for the recipe resource
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    layers = []
    params[:layers][:glaze_ids].each_with_index do |_layer, index|
      layers << Layer.new(
        glaze: Glaze.find(params[:layers][:glaze_ids][index]),
        coat_type: params[:layers][:coat_types][index]
      )
    end
    @recipe.layers = layers

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      @recipe.layers.delete_all
      layers = []
      params[:layers][:glaze_ids].each_with_index do |_layer, index|
        layers << Layer.new(
          glaze: Glaze.find(params[:layers][:glaze_ids][index]),
          coat_type: params[:layers][:coat_types][index]
        )
      end
      @recipe.layers = layers

      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :clay_id, { layers: [:coat_types, :glaze_ids] })
  end
end
