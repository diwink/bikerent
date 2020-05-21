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
    @rent.status = "Pending request"
    if @rent.save
      flash.notice = "Booking for #{@rent.moto.brand} #{@rent.moto.model} asked !"
      redirect_to rents_path
    else
      render :new
    end
  end

  private


  def rent_params
    params.require(:rent).permit(:moto_id, :start_date, :end_date)
  end

end
