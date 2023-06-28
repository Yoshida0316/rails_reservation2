class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @reservations = Reservation.where(user_id: current_user.id )
  end

  def new
  @reservation = Reservation.new(reservation_params)
  end

  def create
     @room = Room.find_by(params[:reservation][:room_id])
     @user = User.find_by(params[:reservation][:room_id])
     @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を確定しました。"
      redirect_to :reservations
   else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
  end
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
   flash[:notice] = "予約を削除しました"
   redirect_to :reservations
  end
  
  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room_id = @room.id
     if @reservation.invalid?
      render template: "rooms/show"
      return
    end
  end
  
  
  def reservation_params
    params.require(:reservation).permit(:checkin_day, :checkout_day, :num_people,:total_price, :room_id, :user_id, :created_at)
  end
  
end
