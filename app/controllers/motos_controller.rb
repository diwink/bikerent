class MotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @motos = Moto.geocoded.order("id DESC")
    @markers = @motos.map do |moto|
      {
        lat: moto.latitude,
        lng: moto.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { moto: moto }),
        image_url: helpers.asset_url('marker.jpg')
      }
    end
  end

  def show
    @moto = Moto.find(params[:id])
    @markers = [{
        lat: @moto.latitude,
        lng: @moto.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { moto: @moto }),
        image_url: helpers.asset_url('marker.jpg')
      }]
    @rent = Rent.new
  end

  def new
    @moto = Moto.new
  end

  def create
    # @photo = Cloudinary::Uploader.upload(params[:photo])
    @moto = Moto.new(moto_params)
    @moto.user = current_user
    if @moto.save
      redirect_to motos_path
    else
      render :new
    end
  end

  def destroy
    @moto = Moto.find(params[:id])
    @moto.destroy
    redirect_to user_bikes_url
  end

  private

  def moto_params
    params.require(:moto).permit(:brand, :model, :address,:description, :price_per_day, :photo)
  end
end
