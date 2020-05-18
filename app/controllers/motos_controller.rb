class MotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @motos = Moto.all
  end

  def show
    @moto = Moto.find(params[:id])
  end

  def new
    @moto = Moto.new
  end

  def create
    @moto = current_user.motos.create!(moto_params)
    if @moto.save
      redirect_to moto_path(@moto)
    else
      render :new
    end

  end

  private

  def moto_params
    params.require(:moto).permit(:brand, :model)
  end
end
