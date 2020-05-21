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
      flash.notice = "#{@rent.moto.brand} booked !"
      redirect_to rents_path
    else
      render :new
    end
  end

  # moto_rent PATCH  /motos/:moto_id/rents/:id(.:format)
  def update
    @rent = Rent.find (params[:id])
    @rent.update(rent_params)
    if @rent.save
      flash.notice = "status updated!"
      redirect_to user_bikes_url
    else
      flash.alert = "status not updated!"
      redirect_to user_bikes_url
    end
  end

  private

  # def total_price
  #   @rent_days = (rent.end_date - rent.start_date) + 1
  #   @price_per_day = rent.moto.price_per_day
  #   @total_price = @rent_days * @price_per_day
  # end

  def rent_params
    params.require(:rent).permit(:moto_id, :start_date, :end_date, :status)
  end

  # def find_moto
  #   @moto = Moto.find(params[:moto_id])
  # end

end
