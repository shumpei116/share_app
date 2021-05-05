class RoomsController < ApplicationController
  

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:succses] = "部屋情報を登録しました"
      redirect_to rooms_path
    else
      render "new"
      flash.now[:danger] = "登録に失敗しました"
    end
  end

  
  def posts
    @rooms = Room.all
  end



  private
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :room_fee, :room_address, :user_id, :image)
    end
  
end
