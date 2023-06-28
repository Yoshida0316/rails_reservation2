class RoomsController < ApplicationController

  before_action :authenticate_user!, except: [:show,:new]#showアクションではログインを確認しない
  before_action :set_q, only: [:index, :search]
  #helper_method :current_user
 
  def index
   @rooms = current_user.rooms
  end
  
  def new
     @room = current_user.rooms.new
  end
 
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
     if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to room_path(@room)
     else
       render :new
     end
   end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
 
  def edit
    @room = Room.find(params[:id])
    if @room.user_id != current_user.id
      redirect_to room_path, alert: '編集権限がありません'
    end
  end
 
  def update
     @room = Room.find(params[:id])
     if @room.update(room_params)
       flash[:notice] = "ユーザーIDが「#{@room.user_id}」の情報を更新しました"
       redirect_to :rooms
     else
       render "edit"
     end
  end
 
  def destroy
  end
  
  def search
    @results = @q.result
  end

  private

  def room_params
    params.require(:room).permit(:room_name,:room_price,:room_address,:room_detail,:image)
  end
  
  def set_q
    @q = Room.ransack(params[:q])
  end

end
