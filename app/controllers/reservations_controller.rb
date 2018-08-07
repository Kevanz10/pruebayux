class ReservationsController < ApplicationController
  def index
    available_rooms = AvailableRooms.new(params).call()
    render json: available_rooms
  end

  def create
    guest = Guest.create(params[:name], params[:social_security], params[:loyalty_membership])
    room = Room.find(params[:room_id])
    start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
    end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
    reservation = Reservation.create(guest_id: guest.id, room: room.id, check_in: start_date, end_date: end_date)
    render json: reservation
  end

  def invoice
    @total_price, @reservation, @discount = InvoiceOrder.new(params).call()
    response ={total_price: @total_price, room_rates: @reservation.room.daily_rates, loyalty_membership_dicount: @discount}
    render json: response 
  end
end
