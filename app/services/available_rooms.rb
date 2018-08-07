class AvailableRooms
  def initialize(params)
    @start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
    @end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
    @reserved_rooms = []
  end

  def call
    get_reserved_rooms
    get_available_rooms
    return @available_rooms
  end

  private
    def get_reserved_rooms
      Reservation.all.each do |x|
      start_time_reservation = x.check_in 
      end_time_reservation = x.check_out
        if @start_date.between?(start_time_reservation, end_time_reservation)
          @reserved_rooms << x.room
        elsif @end_date.between?(start_time_reservation, end_time_reservation)
          @reserved_rooms << x.room
        end
      end
    end

    def get_available_rooms
      @available_rooms = Room.all - @reserved_rooms
    end
end