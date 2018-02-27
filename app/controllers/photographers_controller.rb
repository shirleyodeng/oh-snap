class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  def index
    @photographers = policy_scope(Photographer)
  end

  def show
  end

  def new
    @photographer = Photographer.new
    @photographer_photos = @photographer.photos.build
    authorize @photographer
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user
    authorize @photographer
    respond_to do |format|
    if @photographer.save
      params[:photographer_photos]['avatar'].each do |a|
        @photographer_photos = @photographer.photographer_photos.create!(:avatar => a, :photographer_id => @photographer.id)
      end
      format.html { redirect_to @photographer, notice: 'Post was successfully created.' }
    else
      format.html { render action: 'new' }
      end
    end
    # @photographer.save
    # redirect_to photographer_path(@photographer)
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
    authorize @photographer
  end

  def photographer_params
    params.require(:photographer).permit(:description, :categories, :city, :hourly_rate, :photo, :photo_cache)
  end
end
