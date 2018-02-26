class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  def index
    @photographers = Photographer.all
  end

  def show
  end

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.create(photographer_params)
    redirect_to photographer_path(@photographer)
  end

  def edit
  end

  def update
    @photographer = Photographer.update(photographer_params)
    redirect_to photographer_path(@photographer)
  end

  def destroy
    @photographer.destroy
    # redirect_to user dashboard
  end

  private

  def set_photographer
    @photographer = Photographer.find(params[:id])
  end

  def photographer_params
    params.require(:photographer).permit(:description, :categories, :city, :price, :photos)
  end
end
