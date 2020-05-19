class RentsController < ApplicationController

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @moto = @moto.rent
    @user = current.user
    @rent.save
    redirect_to rent_path
  end

  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end

end
