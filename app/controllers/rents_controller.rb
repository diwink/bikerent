class RentsController < ApplicationController
  # before_action :find_moto, only [ :new ]

  def new
    @moto = Moto.find(params[:moto_id])
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.moto = Moto.find(params[:moto_id])
    @rent.user = current_user
    if @rent.save
      redirect_to moto_path(@rent.moto)
    else
      render :new
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:moto_id, :start_date, :end_date)
  end

  # def find_moto
  #   @moto = Moto.find(params[:moto_id])
  # end

end
