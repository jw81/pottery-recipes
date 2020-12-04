# Actions for the Glaze resource
class GlazesController < ApplicationController
  def index
    @glazes = Glaze.all
  end

  def show
    @glaze = Glaze.find(params[:id])
  end

  def new
    @glaze = Glaze.new
  end

  def edit
    @glaze = Glaze.find(params[:id])
  end

  def create
    @glaze = Glaze.new(glaze_params)

    if @glaze.save
      redirect_to @glaze
    else
      render 'new'
    end
  end

  def update
    @glaze = Glaze.find(params[:id])

    if @glaze.update(glaze_params)
      redirect_to @glaze
    else
      render 'edit'
    end
  end

  def destroy
    @glaze = Glaze.find(params[:id])
    @glaze.destroy

    redirect_to glazes_path
  end

  private

  def glaze_params
    params.require(:glaze).permit(:name, :brand_name, :product_number)
  end
end
