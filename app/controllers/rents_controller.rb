class RentsController < ApplicationController
  # before_action :find_moto, only [ :new ]

  def index
    @user_rents = current_user.rents
  end

  def new
    @moto = Moto.find(params[:moto_id])
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.moto = Moto.find(params[:moto_id])
    @rent.user = current_user
    if @rent.save
      redirect_to rents_path
    else
      render :new
    end
  end

  private

  def total_price
    @rent_days = rent.end_date - rent.start_date
  end

  def rent_params
    params.require(:rent).permit(:moto_id, :start_date, :end_date)
  end

  # def find_moto
  #   @moto = Moto.find(params[:moto_id])
  # end

end
