class ReservationsController < ApplicationController
  before_action :set_q_for_room, only: [:index, :show, :new]
  before_action :authenticate_user!
  before_action :check_paramater, only: :new
  
  def index
    @reservations = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @reservation = current_user.reservations.build
    @total_day = (params[:end_day].to_date - params[:start_day].to_date).to_i
    @total_fee = @room.room_fee * params[:total_people].to_i * @total_day
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
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
    
    def check_paramater
      @room = Room.find_by(params[:room_id])
      if params[:start_day].blank? || params[:end_day].blank? || params[:total_people].blank?
        flash[:danger] = "情報を入力してください"
        redirect_to @room
      elsif params[:end_day] <= params[:start_day] || Date.current > params[:start_day].to_date
        flash[:danger] = "過去の日付は無効です"
        redirect_to @room
      elsif params[:total_people].to_i <= 0
        flash[:danger] = "宿泊人数を正しく入力してください"
        redirect_to @room
      end
    end
end
