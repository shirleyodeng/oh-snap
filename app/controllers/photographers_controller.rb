class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  def index
    @photographers = policy_scope(Photographer)
    if params[:search]
      @photographers = Photographer.search(params[:search].capitalize).order("created_at DESC")
    else
      @photographers = Photographer.all.order("created_at DESC")
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    redirect_to bookings_path if current_user.is_photographer?
    @user = current_user
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

  def update
    @photo = Photo.new(photographer_id: @photographer.id)
    @photographer.update(photographer_params)
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
    params.require(:photographer).permit(:description, :categories, :city, :hourly_rate, :avatar, :avatar_cache, :search)
  end
end
