class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  def index
    @photographers = policy_scope(Photographer)
  end

  def show
    @booking = Booking.new
  end

  def new
    @photographer = Photographer.new
    @photos = @photographer.photos.build
    authorize @photographer
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user
    authorize @photographer
    respond_to do |format|
    if @photographer.save
      params[:photos]['photo'].each do |a|
        @photos = @photographer.photos.create!(:photo => a, :photographer_id => @photographer.id)
      end
      format.html { redirect_to @photographer, notice: 'Photo was successfully created.' }
    else
      format.html { render action: 'new' }
      end
    end
  end

  def edit
    @photo = Photo.new(photographer_id: @photographer.id)
  end

  def update
    @photographer = Photographer.update(photographer_params)
    redirect_to photographer_path(@photographer)
  end

  def destroy
    @photographer.destroy
    redirect_to bookings_path
  end

  private

  def set_photographer
    @photographer = Photographer.find(params[:id])
    authorize @photographer
  end

  def photographer_params
    params.require(:photographer).permit(:description, :categories, :city, :hourly_rate, :avatar, :avatar_cache)
  end
end