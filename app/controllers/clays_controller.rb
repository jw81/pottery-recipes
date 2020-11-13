# Actions for the Clay resource
class ClaysController < ApplicationController
  def index
    @clays = Clay.all
  end

  def show
    @clay = Clay.find(params[:id])
  end

  def new
    @clay = Clay.new
  end

  def edit
    @clay = Clay.find(params[:id])
  end

  def create
    @clay = Clay.new(clay_params)

    if @clay.save
      redirect_to @clay
    else
      render 'new'
    end
  end

  def update
    @clay = Clay.find(params[:id])

    if @clay.update(clay_params)
      redirect_to @clay
    else
      render 'edit'
    end
  end

  def destroy
    @clay = Clay.find(params[:id])
    @clay.destroy

    redirect_to clays_path
  end

  private

  def clay_params
    params.require(:clay).permit(:name, :description, :brand_name)
  end
end
