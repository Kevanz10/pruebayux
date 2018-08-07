class InvoiceOrder
  def initialize(params)
    @minibar = params[:minibar_expenses]
    @reservation = Reservation.find(params[:reservation_id])
    @guest =  @reservation.guest
    @room = @reservation.room
  end

  def call
    get_total_price
    get_price_with_discount
    return @final_price, @reservation , @discount 
  end

  private

    def get_total_price
      total_days = (@reservation.check_out - @reservation.check_in).to_i 
      @total_price = (total_days * @room.daily_rates) + @minibar.to_f
    end

    def get_price_with_discount
      @discount = @guest.discount_member(@total_price)
      @final_price = @total_price - @discount
    end
end