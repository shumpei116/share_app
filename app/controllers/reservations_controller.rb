class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @room = Room.find_by(params[:room_id])
    @reservation = current_user.reservations.build
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:succses] = "ルームの予約が完了しました"
      redirect_to @reservation
    else
      @room = Room.find_by(params[:room_id])
      render "rooms/show"
    end
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:room_id, :total_fee, :start_day, :end_day, :total_people)
    end
end
