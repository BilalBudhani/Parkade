class ParkingLotController < ApplicationController
  layout "default"

  def show
    @domain = Domain.find_by_name(request.host)
    @enquire = Enquire.new
  end


  def offer
    @domain = Domain.find_by_name(request.host)
    @enquire = Enquire.new enquire_params
    @enquire.domain = @domain
    if @enquire.save
      render :show, notice: "Your offer has been captured successfully."
    else
      render :show, alert: "There was an error. Please try again."
    end
  end

  private
  def enquire_params
    params.require(:enquire).permit(:email, :name, :notes, :offer, :phone)
  end

end