class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    respond_to do |format|
      format.js { }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to t_i_path(confirmacion: true)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name1, :name2, :email_name1, :email_name2, :phone_name1, :phone_name2)
  end
end
