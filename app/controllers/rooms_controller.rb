class RoomsController < ApplicationController
  before_action :set_q_for_room, only: [:index, :show, :new, :create, :posts, :search]
  before_action :authenticate_user!, only: [:new, :create, :posts]
  

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "部屋情報を登録しました"
      redirect_to @room
    else
      render "new"
      flash.now[:danger] = "登録に失敗しました"
    end
  end

  
  def posts
    @rooms = current_user.rooms.all
  end
  
  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end 



  private
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :room_fee, :room_address, :user_id, :image, :room_id)
    end
  
end
