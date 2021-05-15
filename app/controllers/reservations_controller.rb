class ReservationsController < ApplicationController
  before_action :set_q_for_room, only: [:index, :show, :new]
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @room = Room.find_by(params[:room_id])
    @reservation = current_user.reservations.build
    @total_day = (params[:end_day].to_date - params[:start_day].to_date).to_i
    @total_fee = @room.room_fee * params[:total_people].to_i * @total_day
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.end_day <= @reservation.start_day || Date.current > @reservation.start_day.to_date
      flash[:danger] = "過去の日付は無効です"
      redirect_to room_path(@reservation.room)
      return
    end
    
    if @reservation.save
      flash[:success] = "ルームの予約が完了しました"
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
